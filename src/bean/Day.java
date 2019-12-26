package bean;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Day {
    private int id;
    private String name;
    private String datatime;
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
    @Column(name = "name", nullable = true, length = 25)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "datatime", nullable = true, length = 25)
    public String getDatatime() {
        return datatime;
    }

    public void setDatatime(String datatime) {
        this.datatime = datatime;
    }

    @Basic
    @Column(name = "AQI", nullable = true, length = 25)
    public String getAqi() {
        return aqi;
    }

    public void setAqi(String aqi) {
        this.aqi = aqi;
    }

    @Basic
    @Column(name = "level", nullable = true, length = 25)
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    @Basic
    @Column(name = "PM25", nullable = true, length = 25)
    public String getPm25() {
        return pm25;
    }

    public void setPm25(String pm25) {
        this.pm25 = pm25;
    }

    @Basic
    @Column(name = "PM10", nullable = true, length = 25)
    public String getPm10() {
        return pm10;
    }

    public void setPm10(String pm10) {
        this.pm10 = pm10;
    }

    @Basic
    @Column(name = "SO2", nullable = true, length = 25)
    public String getSo2() {
        return so2;
    }

    public void setSo2(String so2) {
        this.so2 = so2;
    }

    @Basic
    @Column(name = "CO", nullable = true, length = 25)
    public String getCo() {
        return co;
    }

    public void setCo(String co) {
        this.co = co;
    }

    @Basic
    @Column(name = "NO2", nullable = true, length = 25)
    public String getNo2() {
        return no2;
    }

    public void setNo2(String no2) {
        this.no2 = no2;
    }

    @Basic
    @Column(name = "O3", nullable = true, length = 25)
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
        Day day = (Day) o;
        return id == day.id &&
                Objects.equals(name, day.name) &&
                Objects.equals(datatime, day.datatime) &&
                Objects.equals(aqi, day.aqi) &&
                Objects.equals(level, day.level) &&
                Objects.equals(pm25, day.pm25) &&
                Objects.equals(pm10, day.pm10) &&
                Objects.equals(so2, day.so2) &&
                Objects.equals(co, day.co) &&
                Objects.equals(no2, day.no2) &&
                Objects.equals(o3, day.o3);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, datatime, aqi, level, pm25, pm10, so2, co, no2, o3);
    }
}
