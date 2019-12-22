package action;

import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;

import java.io.InputStream;

public class FileAction implements Action {
    private String fileName;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    //  返回InputStream
    public InputStream getInputStream(){
       return ServletActionContext.getServletContext().getResourceAsStream("/static/files/"+fileName);
    }
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
}
