package ru.productmanager.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import ru.productmanager.dto.FamilyCreateDto;
import ru.productmanager.dto.FamilyMemberAddDto;
import ru.productmanager.dto.FamilyResponse;
import ru.productmanager.model.Family;
import ru.productmanager.security.CurrentUserService;
import ru.productmanager.service.FamilyService;

import java.net.URI;

@RestController
@RequestMapping("/api/families")
@RequiredArgsConstructor
public class FamilyController {
    private final FamilyService service;
    private final CurrentUserService currentUser;

    @PostMapping
    public ResponseEntity<FamilyResponse> create(@Valid @RequestBody FamilyCreateDto dto) {
        Family family = service.create(dto.name(), currentUser.requirePrincipal().getId());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}").buildAndExpand(family.getId()).toUri();
        return ResponseEntity.created(location).body(response(family));
    }

    @GetMapping("/{id}")
    public FamilyResponse get(@PathVariable Long id) {
        currentUser.requireFamilyMember(id);
        return response(service.get(id));
    }

    @PostMapping("/{id}/members")
    public FamilyResponse addMember(@PathVariable Long id, @Valid @RequestBody FamilyMemberAddDto dto) {
        currentUser.requireFamilyMember(id);
        return response(service.addMember(id, dto.email()));
    }

    @DeleteMapping("/{id}/members/{profileId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeMember(@PathVariable Long id, @PathVariable Long profileId) {
        currentUser.requireFamilyMember(id);
        service.removeMember(id, profileId);
    }

    private FamilyResponse response(Family family) {
        return FamilyResponse.from(family, service.getMembers(family.getId()));
    }
}
