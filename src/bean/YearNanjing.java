package bean;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "year_nanjing", schema = "jdata", catalog = "")
public class YearNanjing {
    private int id;
    private String data;
    private String aqi;
    private String range;
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
    @Column(name = "range", nullable = true, length = 255)
    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range;
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
        YearNanjing that = (YearNanjing) o;
        return id == that.id &&
                Objects.equals(data, that.data) &&
                Objects.equals(aqi, that.aqi) &&
                Objects.equals(range, that.range) &&
                Objects.equals(level, that.level) &&
                Objects.equals(pm25, that.pm25) &&
                Objects.equals(pm10, that.pm10) &&
                Objects.equals(so2, that.so2) &&
                Objects.equals(co, that.co) &&
                Objects.equals(no2, that.no2) &&
                Objects.equals(o3, that.o3);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, data, aqi, range, level, pm25, pm10, so2, co, no2, o3);
    }
}
