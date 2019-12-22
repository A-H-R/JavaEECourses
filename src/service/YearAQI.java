package service;

import bean.YearNanjing;

import java.util.List;

public interface YearAQI {
    public List<YearNanjing> getYearAQI();
    public List<YearNanjing> queryByName(String name);
}
