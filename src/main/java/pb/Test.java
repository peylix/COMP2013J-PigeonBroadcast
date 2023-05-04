package pb;

import pb.dao.EmployeeDAO;
import pb.pojo.Employee;

public class Test {
    public static void main(String[] args) {
        Employee employee = EmployeeDAO.getEmployeeByID(213);
        System.out.println(employee.getEmpno());
        EmployeeDAO.updateEmployee(employee, 8);
    }
}
