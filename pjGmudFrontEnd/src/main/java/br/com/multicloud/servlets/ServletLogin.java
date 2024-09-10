package br.com.multicloud.servlets;

import java.io.IOException;
import java.net.InetAddress;
import java.security.NoSuchAlgorithmException;

import br.com.multicloud.dao.DAOLoginRepository;
import br.com.multicloud.modal.ModelLogin;
import br.com.multicloud.modal.loginunificado.Users;
import br.com.multicloud.modal.servise.UserService;
import br.com.multicloud.util.Md5Criptografia;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet( urlPatterns =  {"/principal/ServletLogin"})/*Mapeamento de URL que vem da Tela*/
public class ServletLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private DAOLoginRepository daoLoginRepository = new DAOLoginRepository();  
       
    public ServletLogin() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");
	        InetAddress ia = InetAddress.getLocalHost();
	        String node    = ia.getHostName();
	        
	        if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
				String urlLonginUnificado = "";
		        if(node.equals("PIBASTIANDEV")) urlLonginUnificado = "http://localhost:8080/pjLoginUnificado/index.jsp";
		        else urlLonginUnificado       = "http://10.154.20.134:8080/loginunificado/index.jsp";
		        
 				HttpServletResponse resp = (HttpServletResponse) response;	
 				resp.sendRedirect(urlLonginUnificado);
				return ;// para a execucao e redireciona para o login.
			}else 
			  if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("MontaSecaoInicial") ) {
				String url   = request.getParameter( "url"   );
				String login = request.getParameter( "login" );
				String admin = request.getParameter( "admin" );

				String urlAPIBaseBacktEndLogin   = "";				
				String urlAPIBaseBacktEndMudanca = "";
				String urlAPIInicioPortalLogin   = "";

		        if(node.equals("PIBASTIANDEV")) { 
		        	urlAPIBaseBacktEndLogin   = "http://localhost:8091/";	
		        	urlAPIBaseBacktEndMudanca = "http://localhost:8090/";
		        	urlAPIInicioPortalLogin   = "http://localhost:8080/pjLoginUnificado/principal/PagPrincipal.jsp";
		        }
		        else {
		        	urlAPIBaseBacktEndLogin   = "http://10.154.20.134:8091/";
		        	urlAPIBaseBacktEndMudanca = "http://10.154.20.134:8090/";
		        	urlAPIInicioPortalLogin   = "http://10.154.20.134:8080/loginunificado/principal/PagPrincipal.jsp";
		        }
		        
//		        urlAPIBaseBacktEndMudanca = "http://10.154.20.134:8090/"; // vai apontar sempre para o servidor Linx
				String urlAPIBacktEndMudanca = urlAPIBaseBacktEndMudanca + "PortalMudanca/"; // para uso pelo portal de login unificado.

				String urlBuscaLogin = urlAPIBaseBacktEndLogin + "loginUnificado/buscarByLogin/" + login;
				Users user = UserService.buscaUserLogin( urlBuscaLogin); 
				
				if( user != null ) {

					request.getSession().setAttribute( "usuario"                , user.getLogin()                   );
					request.getSession().setAttribute( "nomeUsuario"            , user.getPessoa().getNome_pessoa() );
					request.getSession().setAttribute( "useradmin"              , admin                             );
					request.getSession().setAttribute( "emailSolicitante"       , user                              );
					request.getSession().setAttribute( "emailSolicitante"       , user.getPessoa().getEmail()       );
					request.getSession().setAttribute( "urlAPI"                 , urlAPIBacktEndMudanca             );
					request.getSession().setAttribute( "urlAPIInicioPortalLogin", urlAPIInicioPortalLogin           );					
					
					if(url == null || url.equalsIgnoreCase("null")) {
					   url = "principal/telaPrincipal.jsp";
					}

					RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
					requestDispatcher.forward(request, response);			
				
				
				}else {
					request.setAttribute("msg", "Login ou Senha incorretos!");
					String urlLonginUnificado = "";
			        if(node.equals("PIBASTIANDEV")) urlLonginUnificado = "http://localhost:8080/pjLoginUnificado/index.jsp";
			        else urlLonginUnificado       = "http://10.154.20.134:8080/loginunificado/index.jsp";
			        
	 				HttpServletResponse resp = (HttpServletResponse) response;	
	 				resp.sendRedirect(urlLonginUnificado);
					return ;// para a execucao e redireciona para o login.
/*					
					RequestDispatcher requestDispatcher = request.getRequestDispatcher(urlAPIBaseFrontEnd + "pjLoginUnificado/ServletLogin");
					request.setAttribute("msg", "Login ou Senha incorretos!");
					requestDispatcher.forward(request, response);
*/					
				}
			}else {
				request.setAttribute("msg", "Login ou Senha incorretos!");
				String urlLonginUnificado = "";
		        if(node.equals("PIBASTIANDEV")) urlLonginUnificado = "http://localhost:8080/pjLoginUnificado/index.jsp";
		        else urlLonginUnificado       = "http://10.154.20.134:8080/loginunificado/index.jsp";
		        
 				HttpServletResponse resp = (HttpServletResponse) response;	
 				resp.sendRedirect(urlLonginUnificado);
				return ;// para a execucao e redireciona para o login.
/*				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("http://10.154.20.134:8080/loginunificado/ServletLogin");
				request.setAttribute("msg", "Informe Login e Senha corretamente!");
				requestDispatcher.forward(request, response);
*/				
			}
				
		}catch(Exception e){
			e.printStackTrace();
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			requestDispatcher.forward(request, response);			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
//		String senha = null;
		
		try {
			senha = Md5Criptografia.convertPasswordToMD5( request.getParameter("senha") );
//			System.out.println("senha: " + senha);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			RequestDispatcher requestDispatcher = (RequestDispatcher) request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage() + " <br> " + e.toString() + " <br> " + e.getLocalizedMessage() + " <br> " + e.getCause() + " <br> " + e.initCause(e) );
			requestDispatcher.forward(request, response);
		}
		String url = request.getParameter("url");
		
		try {
			
			if(login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {
				ModelLogin modelLogin = daoLoginRepository.ValidaLogin(login, senha);
				if( modelLogin != null ) {
					String urlAPI = "";
			        InetAddress ia = InetAddress.getLocalHost();
			        String node = ia.getHostName();
			        
			        if(node.equals("PIBASTIANDEV")) urlAPI = "http://localhost:8090/PortalMudanca/";
			        else urlAPI = "http://10.154.20.134:8090/PortalMudanca/";
			        					
					request.getSession().setAttribute( "usuario"          , modelLogin.getLogin()     );
					request.getSession().setAttribute( "nomeUsuario"      , modelLogin.getNome()      );
					request.getSession().setAttribute( "useradmin"        , modelLogin.getUseradmin() );
					request.getSession().setAttribute( "emailSolicitante" , modelLogin.getEmail()     );
					request.getSession().setAttribute( "urlAPI"           ,urlAPI                     );
					
					if(url == null || url.equalsIgnoreCase("null")) {
					   url = "principal/telaPrincipal.jsp";
					}
					
					RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
					requestDispatcher.forward(request, response);
				}else {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
					request.setAttribute("msg", "Login ou Senha incorretos!");
					requestDispatcher.forward(request, response);
				}
			}else {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg", "Informe Login e Senha corretos!");
				requestDispatcher.forward(request, response);
			}
		}catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage() + " <br> " + e.toString() + " <br> " + e.getLocalizedMessage() + " <br> " + e.getCause() + " <br> " + e.initCause(e) );
			requestDispatcher.forward(request, response);
		}

	
	}

}
