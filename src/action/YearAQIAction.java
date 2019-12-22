package action;

import bean.YearNanjing;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import service.YearAQIImpl;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class YearAQIAction extends ActionSupport {
    @Autowired
    public YearAQIImpl yearAQI;

    public void setYearAQI(YearAQIImpl yearAQI) {
        this.yearAQI = yearAQI;
    }

    public String query() throws IOException {
        List<YearNanjing> list = yearAQI.getYearAQI();
        HttpServletResponse response = ServletActionContext.getResponse();
        String result = JSON.toJSONString(list);
        System.out.println(result);
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().write(result);
        return null;
    }

}
