package kz.zhelezyaka.bankdemo.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
public class User {

    @Id
    private int user_id;
    @NotEmpty(message = "Поле \"Имя\" не может быть пустым")
    @Size(min=3, message = "Поле \"Имя\" должно содержать не менее 3-x символов")
    private String first_name;
    @NotEmpty(message = "Поле Фамилия не может быть пустым")
    @Size(min=3, message = "Поле \"Имя\" должно содержать не менее 3-x символов")
    private String last_name;
    @Email
    @NotEmpty
    @Pattern(regexp = "([a-zA-Z0-9]+(?:[._+-][a-zA-Z0-9]+)*)@([a-zA-Z0-9]+(?:[.-][a-zA-Z0-9]+)*[.][a-zA-Z]{2,})", message = "Пожалуйста, введите действительный адрес электронной почты")
    private String email;
    @NotEmpty
    @NotNull
    private String password;
    private String token;
    private String code;
    private int verified;
    private LocalDate verified_at;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
}