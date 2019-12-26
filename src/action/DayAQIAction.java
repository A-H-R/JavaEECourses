package action;

import bean.YearNanjing;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import service.DayImpl;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DayAQIAction extends ActionSupport {
    @Autowired
    public DayImpl day;
    public void setDay(DayImpl day) {
        this.day = day;
    }

    public String getNinedata() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        List<YearNanjing> list = day.getdata("nanjing");
        response.getWriter().write(JSON.toJSONString(list));
        return null;
    }

    public String getNewOne() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        List<YearNanjing> list = day.getNewOne("nanjing");
        response.getWriter().write(JSON.toJSONString(list));
        return null;
    }
}
