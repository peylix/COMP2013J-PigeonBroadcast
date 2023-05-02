package pb.pojo;

public class Employee {

    private int empno;
    private String firstname;
    private String familyname;
    private String job;
    private float salary;
    private int deptno;


    public Employee(int empno, String firstname, String familyname, String job, float salary, int deptno) {
        super();
        this.empno = empno;
        this.firstname = firstname;
        this.familyname = familyname;
        this.job = job;
        this.salary = salary;
        this.deptno = deptno;
    }


    public int getEmpno() {
        return empno;
    }


    public void setEmpno(int empno) {
        this.empno = empno;
    }


    public String getFirstname() {
        return firstname;
    }


    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }


    public String getFamilyname() {
        return familyname;
    }


    public void setFamilyname(String familyname) {
        this.familyname = familyname;
    }


    public String getJob() {
        return job;
    }


    public void setJob(String job) {
        this.job = job;
    }


    public float getSalary() {
        return salary;
    }


    public void setSalary(float salary) {
        this.salary = salary;
    }


    public int getDeptno() {
        return deptno;
    }


    public void setDeptno(int deptno) {
        this.deptno = deptno;
    }


    public String toString() {
        return this.empno + "\t\t" + this.firstname + "\t\t" + this.familyname + "\t\t" + this.job + "\t\t" + this.salary + "\t\t" + this.deptno;
    }


}
