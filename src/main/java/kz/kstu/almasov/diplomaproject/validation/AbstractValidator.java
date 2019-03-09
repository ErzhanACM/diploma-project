package kz.kstu.almasov.diplomaproject.validation;

import kz.kstu.almasov.diplomaproject.entity.User;

import java.util.Map;
import java.util.TreeMap;

public abstract class AbstractValidator<T> implements Validator<T> {

    private Map<String, String> errorMap;

    public AbstractValidator() {
        this.errorMap = new TreeMap<>();
    }

    public Map<String, String> getErrorMap() {
        return errorMap;
    }

    public void setErrorMap(Map<String, String> errorMap) {
        this.errorMap = errorMap;
    }
}
