package action;

import bean.Addresslist;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import service.AddressImpl;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class AddressAction extends ActionSupport {
    private String name;
    private String phone;
    @Autowired
    private AddressImpl address;

    public void setAddress(AddressImpl address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String add(){
        Addresslist al = new Addresslist();
        al.setName(getName());
        al.setPhone(getPhone());
        address.add(al);
        return SUCCESS;
    }

    public String query() throws IOException {
        List<Addresslist> list = address.query_all();
        HttpServletResponse response = ServletActionContext.getResponse();
        String result = JSON.toJSONString(list);
        System.out.println(result);
        response.getWriter().write(result);
        return null;
    }

    public String login(){
        System.out.println("login.....action");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        String name = request.getParameter("username");
        String phone = request.getParameter("phone");
        PrintWriter out;

        try {
            out = response.getWriter();
            boolean flag = address.login(name,phone);
            String message = "1";
            if (flag == false){
                message = "huruiniubi";
            }
            out.write(message);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}
