package kz.kstu.almasov.diplomaproject.util;

import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@Scope("prototype")
public class PaginationManager<T> {

    public List<Integer> getBody(Page<T> page) {
        List<Integer> body = new ArrayList<>();
        if (page.getTotalPages() <= 7) {
            for (int i = 1; i <= page.getTotalPages(); i++) {
                body.add(i);
            }
        } else {
            int totalPages = page.getTotalPages();
            int pageNumber = page.getNumber() + 1;

            List<Integer> head = getHeadList(pageNumber);
            List<Integer> tail = getTailList(totalPages, pageNumber);
            List<Integer> bodyBefore = getBodyBefore(pageNumber, totalPages);
            List<Integer> bodyAfter = getBodyAfter(pageNumber, totalPages);

            body.addAll(head);
            body.addAll(bodyBefore);
            if (pageNumber > 3 && pageNumber < (totalPages - 2)) {
                body.add(pageNumber);
            }
            body.addAll(bodyAfter);
            body.addAll(tail);
        }
        return body;
    }

    private List<Integer> getHeadList(int pageNumber) {
        List<Integer> head = new ArrayList<>();
        if (pageNumber > 4) {
            head.add(1);
            head.add(-1);
        } else {
            head.add(1);
            head.add(2);
            head.add(3);
        }
        return head;
    }

    private List<Integer> getBodyBefore(int pageNumber, int totalPages) {
        List<Integer> bodyBefore = new ArrayList<>();
        if (pageNumber > 4 && pageNumber < (totalPages - 1)) {
            bodyBefore.add(pageNumber - 2);
            bodyBefore.add(pageNumber - 1);
        }
        return bodyBefore;
    }

    private List<Integer> getBodyAfter(int pageNumber, int totalPages) {
        List<Integer> bodyAfter = new ArrayList<>();
        if (pageNumber > 2 && pageNumber < (totalPages - 3)) {
            bodyAfter.add(pageNumber + 1);
            bodyAfter.add(pageNumber + 2);
        }
        return bodyAfter;
    }

    private List<Integer> getTailList(int totalPages, int pageNumber) {
        List<Integer> tail = new ArrayList<>();
        if (pageNumber < (totalPages-3)) {
            tail.add(-1);
            tail.add(totalPages);
        } else {
            tail.add(totalPages-2);
            tail.add(totalPages-1);
            tail.add(totalPages);
        }
        return tail;
    }

}
