package com.sist.util;

import lombok.Getter;

import java.util.List;

@Getter
public class Pagination {

    private final List<?> items;

    private final int totalItem;

    private final int blockSize;

    private final int page;

    private int startPage;

    private int endPage;

    private int totalPage;

    private boolean isFirst;

    private boolean isLast;

    private boolean hasNext;

    private boolean hasPrev;

    public Pagination(List<?> items, int page, int totalCount, int blockSize) {
        this.items = items;
        this.blockSize = blockSize;
        this.totalItem = totalCount;
        this.page = page;
        setTotalPage();
        makeBlock(page);
        setFirst();
        setLast();
        setHasPrev();
        setHasNext();
    }

    private void makeBlock(int page) {
        int rowSize = 10;   // 숫자 선택 블록 개수
        int temp = (int) Math.floor((page - 1) / rowSize);
        startPage = (rowSize * temp) + 1;
        endPage = startPage + (rowSize - 1);
        if (totalPage <= endPage) {
            endPage = totalPage;
        }
    }

    private void setTotalPage() {
        if (totalItem % 9 == 0) {
            this.totalPage = totalItem / 9;
        } else {
            this.totalPage = (totalItem / 9) + 1;
        }
    }

    private void setFirst() {
        if (page == 1) {
            isFirst = true;
        }
    }

    private void setLast() {
        if (page == totalPage) {
            isLast = true;
        }
    }

    private void setHasPrev() {
        if (isFirst) {
            hasPrev = false;
        }
    }

    private void setHasNext() {
        if (isLast) {
            hasNext = false;
        }
    }

}
