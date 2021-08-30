package org.agrisud.elearningAPI.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
public class Registration {
    String firstName;
    String lastName;
    String email;
    String birthDate;
    String nationality;
    String occupation;
    String organisation;
    String sex;
    String password;
}
