import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.CustomerVO;
import com.service.CalculateBill;

/**
 * Servlet implementation class CalcBill
 */
@WebServlet("/CalcBill")
public class CalcBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalcBill() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CustomerVO lCustomerVO= new CustomerVO();
		lCustomerVO.setCustName(request.getParameter("username"));
		lCustomerVO.setItem1(Integer.parseInt(request.getParameter("item1")));
		lCustomerVO.setItem2(Integer.parseInt(request.getParameter("item2")));
		lCustomerVO.setItem3(Integer.parseInt(request.getParameter("item3")));
		lCustomerVO.setItem4(Integer.parseInt(request.getParameter("item4")));
		CalculateBill lCalculateBill=new CalculateBill();
		int total=lCalculateBill.calculateBill(lCustomerVO);
		
		session=request.getSession(true);
		session.setAttribute("Status", "success");
		session.setAttribute("Bill", total);
		/*
		List<String> lines = Arrays.asList(lCustomerVO.getCustName()+"|"+lCustomerVO.getItem1()+"|"+lCustomerVO.getItem2()+"|"+lCustomerVO.getItem3()+"|"+lCustomerVO.getItem4());
		Path file = Paths.get("Test.txt");
		Files.write(file, lines, StandardCharsets.UTF_8);
		*/
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		   LocalDateTime now = LocalDateTime.now();  
		   System.out.println(dtf.format(now)); 
		   
		   DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
		   LocalDateTime now1 = LocalDateTime.now();  
		 
		   String dateNow="Transac-"+dtf1.format(now1);
		   System.out.println(dateNow); 
		   
		String content =lCustomerVO.getCustName()+"|"+lCustomerVO.getItem1()+"|"+lCustomerVO.getItem2()+"|"+lCustomerVO.getItem3()+"|"+lCustomerVO.getItem4()+"|"+total+"|"+now;
		
		
		String PATH = "C:\\\\data";
	//  String directoryName = PATH.concat(this.getClassName());
	  

//	    File directory = new File("C:\\\\data");
	    File directory = new File("/data");
	    if (! directory.exists()){
	        directory.mkdir();      
	    }
		
	//  try (FileWriter writer = new FileWriter("C:\\data\\"+dateNow+".log", true);
		try (FileWriter writer = new FileWriter("/data/"+dateNow+".log", true);
				 BufferedWriter bw = new BufferedWriter(writer)) {
                 System.out.println("Appending or creating");
				bw.write(content+"\n");

			} catch (IOException e) {
				System.err.format("IOException: %s%n", e);
			}
		
		
		response.sendRedirect("home.jsp");
		doGet(request, response);
	}

}
