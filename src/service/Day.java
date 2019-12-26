package service;

import bean.YearNanjing;

import java.util.List;

public interface Day {
    public List<YearNanjing> getdata(String name);
    public List<YearNanjing> getNewOne(String name);
}
