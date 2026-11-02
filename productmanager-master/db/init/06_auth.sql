-- Пароль и роль для Spring Security (вход по email + пароль)

ALTER TABLE user_profile
    ADD COLUMN IF NOT EXISTS password_hash VARCHAR(255);

ALTER TABLE user_profile
    ADD COLUMN IF NOT EXISTS role VARCHAR(32) NOT NULL DEFAULT 'USER';

ALTER TABLE user_profile DROP CONSTRAINT IF EXISTS chk_user_profile_role;
ALTER TABLE user_profile
    ADD CONSTRAINT chk_user_profile_role CHECK (role IN ('USER', 'ADMIN'));

-- для уже существующих профилей без пароля ставим заведомо невалидный хеш:
-- войти можно только после повторной регистрации или сброса пароля
UPDATE user_profile
SET password_hash = '{bcrypt}$2a$10$invalidinvalidinvalidinvalidinvalidinvalidinval'
WHERE password_hash IS NULL;

ALTER TABLE user_profile
    ALTER COLUMN password_hash SET NOT NULL;
