package bean;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Month {
    private int id;
    private String data;
    private String aqi;
    private String level;
    private String pm25;
    private String pm10;
    private String so2;
    private String co;
    private String no2;
    private String o3;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "data", nullable = true, length = 255)
    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    @Basic
    @Column(name = "AQI", nullable = true, length = 255)
    public String getAqi() {
        return aqi;
    }

    public void setAqi(String aqi) {
        this.aqi = aqi;
    }

    @Basic
    @Column(name = "level", nullable = true, length = 255)
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    @Basic
    @Column(name = "PM25", nullable = true, length = 255)
    public String getPm25() {
        return pm25;
    }

    public void setPm25(String pm25) {
        this.pm25 = pm25;
    }

    @Basic
    @Column(name = "PM10", nullable = true, length = 255)
    public String getPm10() {
        return pm10;
    }

    public void setPm10(String pm10) {
        this.pm10 = pm10;
    }

    @Basic
    @Column(name = "SO2", nullable = true, length = 255)
    public String getSo2() {
        return so2;
    }

    public void setSo2(String so2) {
        this.so2 = so2;
    }

    @Basic
    @Column(name = "CO", nullable = true, length = 255)
    public String getCo() {
        return co;
    }

    public void setCo(String co) {
        this.co = co;
    }

    @Basic
    @Column(name = "NO2", nullable = true, length = 255)
    public String getNo2() {
        return no2;
    }

    public void setNo2(String no2) {
        this.no2 = no2;
    }

    @Basic
    @Column(name = "O3", nullable = true, length = 255)
    public String getO3() {
        return o3;
    }

    public void setO3(String o3) {
        this.o3 = o3;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Month month = (Month) o;
        return id == month.id &&
                Objects.equals(data, month.data) &&
                Objects.equals(aqi, month.aqi) &&
                Objects.equals(level, month.level) &&
                Objects.equals(pm25, month.pm25) &&
                Objects.equals(pm10, month.pm10) &&
                Objects.equals(so2, month.so2) &&
                Objects.equals(co, month.co) &&
                Objects.equals(no2, month.no2) &&
                Objects.equals(o3, month.o3);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, data, aqi, level, pm25, pm10, so2, co, no2, o3);
    }
}
