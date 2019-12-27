package bean;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class City {
    private int id;
    private String cityname;
    private String tip;
    private String num;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "cityname", nullable = true, length = 25)
    public String getCityname() {
        return cityname;
    }

    public void setCityname(String cityname) {
        this.cityname = cityname;
    }

    @Basic
    @Column(name = "tip", nullable = true, length = 25)
    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    @Basic
    @Column(name = "num", nullable = true, length = 10)
    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        City city = (City) o;
        return id == city.id &&
                Objects.equals(cityname, city.cityname) &&
                Objects.equals(tip, city.tip) &&
                Objects.equals(num, city.num);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, cityname, tip, num);
    }
}
