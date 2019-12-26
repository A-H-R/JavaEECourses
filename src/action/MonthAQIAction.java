package action;

import bean.Month;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import service.MonthImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class MonthAQIAction extends ActionSupport {
    @Autowired
    public MonthImpl month;

    public void setMonth(MonthImpl month) {
        this.month = month;
    }
    public String query() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        String cityname = request.getParameter("cityname");
        String data = request.getParameter("data");
        data=data.replace("/","");
        System.out.println(data);
        List<Month> list = month.query(cityname,data);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().write(JSON.toJSONString(list));
        return null;
    }
}
