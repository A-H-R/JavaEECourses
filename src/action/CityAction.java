package action;

import bean.City;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import service.CityImpl;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CityAction extends ActionSupport {
    @Autowired
    public CityImpl city;

    public void setCity(CityImpl city) {
        this.city = city;
    }

    public String getcityname() throws IOException {
        List<City> list = city.getcity();
        HttpServletResponse response = ServletActionContext.getResponse();
        String result = JSON.toJSONString(list);
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().write(JSON.toJSONString(list));
        return null;
    }
}
