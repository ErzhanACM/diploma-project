package kz.kstu.almasov.diplomaproject.validation;

public interface Validator<T> {

    boolean validate(T object);
}
