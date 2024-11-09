package br.com.multicloud.servlets;

import java.io.IOException;
import java.net.InetAddress;


import br.com.multicloud.modal.loginunificado.Users;
import br.com.multicloud.modal.servise.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet( urlPatterns =  {"/principal/ServletLogin"})/*Mapeamento de URL que vem da Tela*/
public class ServletLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    public ServletLogin() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String acao          = request.getParameter("acao");
	        InetAddress ia       = InetAddress.getLocalHost();
	        String node          = ia.getHostName();
	        HttpSession session  = request.getSession();
	        String usuarioLogado = (String) session.getAttribute("usuario");
	        String login         = request.getParameter( "login" );
	        String statusSessao  = (String) session.getAttribute("StatusSessao");

	        if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("manuLoginUnificado")) {
				String urlLonginUnificado = "";
		        if(node.equals("PIBASTIANDEV")) urlLonginUnificado = "http://localhost:8080/pjLoginUnificado/principal/PagPrincipal.jsp";
		        else urlLonginUnificado       = "http://10.154.20.134:8080/loginunificado/principal/PagPrincipal.jsp";
		        request.getSession().invalidate();
		        HttpServletResponse resp = (HttpServletResponse) response;	
 				resp.sendRedirect(urlLonginUnificado);
				return ;// para a execucao e redireciona para o login.
			}if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
				String urlLonginUnificado = "";
		        if(node.equals("PIBASTIANDEV")) urlLonginUnificado = "http://localhost:8080/pjLoginUnificado/index.jsp";
		        else urlLonginUnificado       = "http://10.154.20.134:8080/loginunificado/index.jsp";
		        request.getSession().invalidate();
		        HttpServletResponse resp = (HttpServletResponse) response;	
 				resp.sendRedirect(urlLonginUnificado);
				return ;// para a execucao e redireciona para o login.
			} else if( ( usuarioLogado != null && !usuarioLogado.isEmpty() && statusSessao != null && !statusSessao.isEmpty() ) && (statusSessao.equals("PrimeiroAcesso")) ) {
				request.getSession().setAttribute( "StatusSessao", "PrimeiroAcessoOK" );
                String urlPortalMultiCloud = null; 
		        if(node.equals("PIBASTIANDEV")) urlPortalMultiCloud = "http://localhost:8083/gestaodemudanca/principal/telaPrincipal.jsp";
		        else urlPortalMultiCloud = "http://10.154.20.134:8080/gestaodemudanca/principal/telaPrincipal.jsp";
		  		HttpServletResponse resp = (HttpServletResponse) response;	
				resp.sendRedirect(urlPortalMultiCloud);
			}else if( (usuarioLogado != null && !usuarioLogado.isEmpty()) && (!usuarioLogado.equals(login)) ) {
				request.setAttribute("msg", "Favor realizar Login com seu usuário!");
				String urlLonginUnificado = "";
		        if(node.equals("PIBASTIANDEV")) urlLonginUnificado = "http://localhost:8080/pjLoginUnificado/index.jsp";
		        else urlLonginUnificado       = "http://10.154.20.134:8080/loginunificado/index.jsp";
		        request.getSession().invalidate();
 				HttpServletResponse resp = (HttpServletResponse) response;	
 				resp.sendRedirect(urlLonginUnificado);
				return ;// para a execucao e redireciona para o login.
			}else {
				request.setAttribute("msg", "Favot efetura Login!");
				String urlLonginUnificado = "";
		        if(node.equals("PIBASTIANDEV")) urlLonginUnificado = "http://localhost:8080/pjLoginUnificado/index.jsp";
		        else urlLonginUnificado       = "http://10.154.20.134:8080/loginunificado/index.jsp";
		        request.getSession().invalidate();
 				HttpServletResponse resp = (HttpServletResponse) response;	
 				resp.sendRedirect(urlLonginUnificado);
				return ;// para a execucao e redireciona para o login.
			}
		}catch(Exception e){
			request.getSession().invalidate();
			e.printStackTrace();
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			requestDispatcher.forward(request, response);			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			InetAddress ia      = InetAddress.getLocalHost();
	        String node         = ia.getHostName();
	        String StatusSessao = request.getParameter("StatusSessao");
	        
	        if( StatusSessao != null && !StatusSessao.isEmpty() && StatusSessao.equalsIgnoreCase("PrimeiroAcesso") ) {
				String login          = request.getParameter( "login"          );
				String admin          = request.getParameter( "admin"          );
				String urlDoGet       = request.getParameter( "urlDoGet"       );
				String urlLogin       = request.getParameter( "urlLogin"       );

				if( login != null && !login.isEmpty() ) {
					
					String urlAPIBaseBacktEndMudanca = "";
					String urlAPIBaseBacktEndLogin   = "";
					String urlAPIInicioPortalLogin   = "";
			        if(node.equals("PIBASTIANDEV")) {
			        	urlAPIBaseBacktEndMudanca = "http://localhost:8090/";
			        	urlAPIBaseBacktEndLogin   = "http://localhost:8091/";
			        	urlAPIInicioPortalLogin   = "http://localhost:8080/pjLoginUnificado/principal/PagPrincipal.jsp";
			        } else {
			        	urlAPIBaseBacktEndMudanca = "http://10.154.20.134:8090/";
			        	urlAPIBaseBacktEndLogin   = "http://10.154.20.134:8091/";
			        	urlAPIInicioPortalLogin   = "http://10.154.20.134:8080/loginunificado/principal/PagPrincipal.jsp";
			        }

					String urlAPIBacktEndMudanca = urlAPIBaseBacktEndMudanca + "PortalMudanca/"; // para uso pelo portal de login unificado.
					String urlBuscaLogin         = urlAPIBaseBacktEndLogin + "loginUnificado/buscarByLogin/" + login;
					Users user                   = UserService.buscaUserLogin( urlBuscaLogin); 
					
					if( user != null ) {
						request.getSession().setAttribute( "usuario"                , user.getLogin()                   );
						request.getSession().setAttribute( "nomeUsuario"            , user.getPessoa().getNome_pessoa() );
						request.getSession().setAttribute( "useradmin"              , admin                             );
						request.getSession().setAttribute( "emailSolicitante"       , user.getPessoa().getEmail()       );
						request.getSession().setAttribute( "urlAPI"                 , urlAPIBacktEndMudanca             );
						request.getSession().setAttribute( "urlAPIInicioPortalLogin", urlAPIInicioPortalLogin           );					
						request.getSession().setAttribute( "StatusSessao"           , "PrimeiroAcesso"                  );
						
						HttpServletResponse resp = (HttpServletResponse) response;	
						resp.sendRedirect(urlDoGet);
					}else {
						request.setAttribute("msg", "Favor efetura Login!");
						request.getSession().invalidate();
		 				HttpServletResponse resp = (HttpServletResponse) response;	
		 				resp.sendRedirect(urlLogin + "index.jsp");
						return ;// para a execucao e redireciona para o login.
					} 
				}else {
					request.setAttribute("msg", "Favor efetura Login!");
					String urlLonginUnificado = "";
			        if(node.equals("PIBASTIANDEV")) urlLonginUnificado = "http://localhost:8080/pjLoginUnificado/index.jsp";
			        else urlLonginUnificado       = "http://10.154.20.134:8080/loginunificado/index.jsp";
			        request.getSession().invalidate();
	 				HttpServletResponse resp = (HttpServletResponse) response;	
	 				resp.sendRedirect(urlLonginUnificado);
					return ;// para a execucao e redireciona para o login.
				}
	        }else {
				request.setAttribute("msg", "Favor efetura Login!");
				String urlLonginUnificado = "";
		        if(node.equals("PIBASTIANDEV")) urlLonginUnificado = "http://localhost:8080/pjLoginUnificado/index.jsp";
		        else urlLonginUnificado       = "http://10.154.20.134:8080/loginunificado/index.jsp";
		        request.getSession().invalidate();
 				HttpServletResponse resp = (HttpServletResponse) response;	
 				resp.sendRedirect(urlLonginUnificado);
				return ;// para a execucao e redireciona para o login.
			}	

		}catch(Exception e){
			e.printStackTrace();
			request.getSession().invalidate();
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			requestDispatcher.forward(request, response);			
		}
	
		
	}
}
