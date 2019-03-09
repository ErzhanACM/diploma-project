package kz.kstu.almasov.diplomaproject.validation;

import kz.kstu.almasov.diplomaproject.entity.User;

public abstract class AbstractValidator<T> implements Validator<T> {

    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
