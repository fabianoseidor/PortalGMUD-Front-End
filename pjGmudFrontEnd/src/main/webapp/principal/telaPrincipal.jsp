<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>    
    
        
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<jsp:include page="/util/head.jsp"></jsp:include>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

   <style>
       
.modal:nth-of-type(even) {
    z-index: 1052 !important;
}
.modal-backdrop.show:nth-of-type(even) {
    z-index: 1051 !important;
}
    
       .mesmo-tamanho-botao {
           width: 20%;
           white-space: normal;
       }
       
       .t-modal .modal-content{
           border-top-left-radius: 10px;
           border-top-right-radius: 10px;
           
           border-bottom-left-radius: 10px;
           border-bottom-right-radius: 10px;
           
           border-bottom: 3px solid transparent;
       }
       
       
       .t-modal .modal-header{
          padding: 30px 15px;
       }
       
        .t-modal .modal-title{
          text-transform: uppercase;
          font-size: 20px;
       }
       
       .t-modal .modal-title,
       .t-modal .close{
          color: #fff;
       }
       
       .t-modal.primary .modal-content{
          border-color: #4a69bd; 
       }
       .t-modal.primary .modal-header{
          background-color: #4a69bd;
       }

        hr {
            height: 3px;
            background-color: #708090;
            border: none;
        }
        
		.tooltip-inner {
		  background-color: #5A72FE !important;
		  /*!important is not necessary if you place custom.css at the end of your css calls. For the purpose of this demo, it seems to be required in SO snippet*/
		  color: #fff;
		}
		
		.tooltip.top .tooltip-arrow {
		  border-top-color: #00acd6;
		}
		
		.tooltip.right .tooltip-arrow {
		  border-right-color: #00acd6;
		}
		
		.tooltip.bottom .tooltip-arrow {
		  border-bottom-color: #00acd6;
		}
		
		.tooltip.left .tooltip-arrow {
		  border-left-color: #00acd6;
		}
		
		input[type="file"]{
			display: none;
		}

       .pequeno {
           width: 20%;
       }

       .medio {
           width: 30%;
       }

   </style>

  <body>
  <!-- Pre-loader start -->
  <jsp:include page="/util/theme-loader.jsp"></jsp:include>
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          
          <!-- Chamada para o Menu de Barras -->
          <jsp:include page="/util/navbarheader.jsp"></jsp:include>
          
          <div class="pcoded-main-container">
             <div class="pcoded-wrapper">
                  <!-- Page-header start -->
                  <jsp:include page="/util/pageheader.jsp"></jsp:include>
                  <!-- Page-header end -->
                  <div class="pcoded-inner-content">
                     <!-- Main-body start -->
                     <div class="main-body">
                        <div class="page-wrapper">
                           <!-- Page-body start -->
                           <div class="page-body">
                              <div class="row">
                                 <div class="col-sm-12">
								    <!-- Basic Form Inputs card start -->
                                    <form class="form-material" action="" method="post" id="formPrincipal" >

                                       <!-- URL da base da API Base TST ou PRD  -->
                                       <input type="hidden"  name="urlAPI" id="urlAPI" value="<%=session.getAttribute("urlAPI")%>">

			                           <!-- Botao para acionar modal -->  
			                           <div class="form-row">
											<div class="btn-group" role="group" aria-label="Grupo de botões com dropdown aninhado">
											
											  <div class="btn-group" role="group">
											    <button id="btnGroupDrop1" type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											      Abertura de GMUD
											    </button>
											    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
											      <a class="dropdown-item" href="<%= request.getContextPath() %>/cadastro/cadNormal.jsp"         >Normal               </a>
											      <a class="dropdown-item" href="<%= request.getContextPath() %>/cadastro/cadEmergencial.jsp"    >Emergencial          </a>
											      <a class="dropdown-item" href="<%= request.getContextPath() %>/cadastro/cadPadrao.jsp"         >Padrão               </a>
											    </div>
											  </div>
											<!--    <button type="button" class="btn btn-outline-primary">GUMD Abertas</button> -->
											  <button type="button" class="btn btn-outline-primary" onclick="goToPesquisa();">GUMD Pesquisar</button>
											  <button type="button" class="btn btn-outline-primary" onclick="goToAprovacao();">Aprovação GUMD</button>

											  <div class="btn-group" role="group">
											    <button id="btnGroupDrop1" type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											      Cad. Categoria Padrão 
											    </button>
											    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
											      <a class="dropdown-item" href="<%= request.getContextPath() %>/cadastro/cadCategoriaPadrao.jsp">Cadastro</a>
											      <a class="dropdown-item" href="<%= request.getContextPath() %>/manutencao/manutCategoriaPadrao.jsp">Manutenção</a>
											    </div>
											  </div>

											  <div class="btn-group" role="group">
											    <button id="btnGroupDrop1" type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											      Tarefas 
											    </button>
											    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
											      <a class="dropdown-item" href="<%= request.getContextPath() %>/manutencao/manutTarefas.jsp">Tarefa por Responsável</a>
											    </div>
											  </div>
											</div>
							           </div>
                                     </form>
                                 </div>
                              </div>
                              <br>
                              <br>
                              
							  <!-- Campo destinado listar os Cliente no pe da tela -->
							   <div class="row">
								<div class="col-sm-12">
									<!-- Basic Form Inputs card start -->
									<div class="card">
										<div class="card-block">
											<div class="tab-pane fade show active" id="recurso" role="tabpanel" aria-labelledby="recurso-tab">
											    <div style="height: 500px; overflow: scroll;">                                              
													<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaResutado">
													  <thead>
													    <tr class="table-primary">
													      <th scope="col" style="text-align: center; vertical-align: middle;color: white">ID             </th>
													      <th scope="col" style="vertical-align: middle;color: white"                    >Título Mudança </th>
													      <th scope="col" style="vertical-align: middle;color: white"                    >Data Criação   </th>
													      <th scope="col" style="vertical-align: middle;color: white"                    >Login Criação  </th>
													      <th scope="col" style="vertical-align: middle;color: white"                    >Status Mudança </th>
													      <th scope="col" style="vertical-align: middle;color: white"                    >Tipo Mudança   </th>
													      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Executar Tarefa</th>
													      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Selecionar     </th>
													    </tr>
													  </thead>
													  <tbody>
												      <!-- Corpo da Mensagem -->
												      </tbody>
											        </table>
										        </div>                                                            
                                            </div>
                                            <nav id="navegacaoPag" aria-label="Navegação de página"> </nav>
										</div>
									</div>
								</div>
							 </div> 
							                              
                           </div>
                            <!-- Page-body end -->
                        </div>
                        <div id="styleSelector"> </div>
                     </div>
                  </div>
             </div>
          </div>
      </div>
  </div>

  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

  <jsp:include page="modalTarefa.jsp"></jsp:include>
  <jsp:include page="modalTranfTarefa.jsp"></jsp:include>
 
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/modalTarefa.js"></script> 

  <jsp:include page="/util/javascriptfile.jsp"></jsp:include>

 <script type="text/javascript">
 
   ListarGemuds( 0 ); // Inicializa com as 10 primeiras GUMD's abertas

   async function getTotalPagRenovacao( totalCad, offsetEnd ) {
		let pagina      = 0.0;
		
		pagina = totalCad / offsetEnd;
		
		let resto = pagina % 2;
		if(resto > 0) pagina++;
		
		return parseInt(pagina);
	}
   
   $(document).on('hidden.bs.modal', function(event){
	  if( $('.modal:visible').length ){
		  $('body').addClass('modal-open');
	  }
   });

   /*================================================================================*/
   /*                                                                                */
   /*                                                                                */
   /*                                                                                */
   /*================================================================================*/
   async function ListarGemuds( pag ){
	   try {
			let OFFSET_END      = 10;
			let offsetBegin     = 0;
			
	   
			let urlBase         = document.getElementById( 'urlAPI' ).value;
			const url           = urlBase + 'qtyTotalMudancaAbertas';
			const qtyMudAbertas = await fetch(url).then(response => response.json());
			let totalPag        = 0;
	   
			if( qtyMudAbertas > 0 ) totalPag = await getTotalPagRenovacao( qtyMudAbertas, OFFSET_END );
			else throw 'Não existe Mudança em aberto!';
	   
			let CalculoOffsetBegin = ( qtyMudAbertas - ( (pag+1) * OFFSET_END) );
			
			offsetBegin = CalculoOffsetBegin;
			
			if( CalculoOffsetBegin < 0 ){
				offsetBegin = 0;
				OFFSET_END  = qtyMudAbertas - ( ( totalPag - 1 ) * OFFSET_END );
            }

			const urlListCatPadr = urlBase + '/listaMudancaAbertas/' + offsetBegin + '/' + OFFSET_END;
			
			const response = await fetch(urlListCatPadr).then(response => response.json());

			let botaoURL = '';
			$('#tabelaResutado > tbody > tr').remove();

			for(var p = 0; p < response.length; p++){

					
//				var teste = '<td> <button onclick="getTarefaPorIdGMUD( ' + '\'' + urlBase + '\'' + ', ' +  response[p].id_mudanca  + ' );" type="button" class="btn btn-outline-success active" style="border-radius: 25px;">Tarefas</button></td>';
				

				if(response[p].tipoMudanca.id_tipo_mudanca === 1 ){
					botaoURL = getContextPath() + '/manutencao/manutNormal.jsp?idMudanca=' + response[p].id_mudanca;
				}else if(response[p].tipoMudanca.id_tipo_mudanca === 2 ){
  				   botaoURL = getContextPath() + '/manutencao/manutEmergencial.jsp?idMudanca=' + response[p].id_mudanca;
				}else if(response[p].tipoMudanca.id_tipo_mudanca === 3 ){
  				   botaoURL = getContextPath() + '/manutencao/manutPadrao.jsp?idMudanca=' + response[p].id_mudanca;
				}
		      
				$('#tabelaResutado > tbody').append('<tr>'                                                                           + 
				                                    '  <td scope="col" style="text-align: center; vertical-align: middle">'          + 
				                                         response[p].id_mudanca                                                      +
				                                    '  </td>'                                                                        +
				                                    '  <td scope="col" style="vertical-align: middle">'                              + 
				                                         response[p].titulo_mudanca                                                  +
				                                    '  </td>'                                                                        +
				                                    '  <td scope="col" style="vertical-align: middle">'                              +
				                                         formatData(2, formatDataStr( response[p].dt_criacao ) )                     +
				                                    '  </td>'                                                                        +
				                                    '  <td scope="col" style="vertical-align: middle">'                              +
				                                         response[p].login_user                                                      +
			                                    '  </td>'                                                                            +
				                                    '  <td scope="col" style="vertical-align: middle">'                              +
				                                         response[p].statusMudanca                                                   +
			                                    '  </td>'                                                                            +
				                                    '  <td scope="col" style="vertical-align: middle">'                              +
				                                         response[p].tipoMudanca.tipo_mudanca                                        +
			                                    '  </td>'                                                                            +
			                                    '  <td scope="col" style="text-align: center; vertical-align: middle"> '             +
			                                    '   <button onclick="getTarefaPorIdGMUD( ' + '\'' + urlBase + '\'' + ', ' +  response[p].id_mudanca + ', ' + '\''  + response[p].login_user + '\'' + ' );" type="button" class="btn btn-outline-success active" style="border-radius: 25px;">Tarefas</button>' +
			                                    ' </td>'                                                                             +
				                                '  <td scope="col" style="text-align: center; vertical-align: middle">'              +
				                                    '    <a href="' + botaoURL + '" class="btn btn-outline-success active" style="border-radius: 25px;" role="button" aria-pressed="true">Selecionar</a>' +
				                                    '  </td>'                +
				                                    '</tr>');
				botaoURL = '';				
			}
			
			$('#navegacaoPag > ul').remove();
			var liPaginacao = '<ul class="pagination">';
			for(var p = 0; p < totalPag; p++){
				  if( pag === p )
				      liPaginacao +=  "<li class=\"page-item active\" onclick=\"ListarGemuds(" + p + " ); \"><a class=\"page-link\" href=\"#\">" + ( p + 1 ) + "</a></li>";
				  else  
					liPaginacao +=  "<li class=\"page-item\" onclick=\"ListarGemuds(" + p + " ); \"><a class=\"page-link\" href=\"#\">" + ( p + 1 ) + "</a></li>";
			}

			liPaginacao += "</ul>";

			$("#navegacaoPag").html(liPaginacao).show(); 
			
	   } catch (error) {
		    hideLoading();
//		    alert("Erro ao Listar Mudanças: " + error );
		    let msn   = error;
		    let iconi = '';
            if( error === 'Não existe Mudança em aberto!') iconi = "info";
            else iconi = "error";

            MensagemConfimacao( iconi, "Listar Mudanças", msn ) ;
		}
   }
   
   function MensagemConfimacao( iconi, tituloPrincipal, textoPrincipal ) {
		// icon
//	  	"warning"
//	  	"error"
//	  	"success"
//	  	"info"

		  Swal.fire({
			    icon  : iconi                             ,
			    title : tituloPrincipal                   ,
			    text  : textoPrincipal                    ,
			    }
			);	    		
   }

   function formatDataStr( data ) {
		let tam    = data.length;
		let dtFort;
	    
		if( tam === 7 ){
			dtFort = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' + data[5];
	    }else dtFort = data;
		
		return dtFort;
	 
	  }

    function formatData( tipo, data ) {
		const dataCriada = new Date(data);
		let dataFormatada;
//			
	    if( tipo === 1){
	        dataFormatada = dataCriada.toLocaleDateString('pt-BR', {timeZone: 'UTC',}); // Saida: 21/08/1988
	    }else{
		    dataFormatada = dataCriada.toLocaleString('pt-BR', { timezone: 'UTC' }); // Saida: 20/10/2023 07:11:08
	    }
		return dataFormatada;
	}

    function goToAprovacao() {
    	window.location.href = getContextPath() + "/manutencao/cadAprovacaoGMUD.jsp";
	} 
    
    function goToPesquisa() {
    	window.location.href = getContextPath() + "/pesquisa/PesquisaGMUD.jsp";
	} 
  
    
    function getContextPath() {
 	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    }
   
/*   
 // Exemplo com Promesse

   function ListarGemuds4(){
	   	alert('Passei 4');
			
	   	fetch('http://localhost:8090/PortalMudanca/listaMudancaAbertas').then( response=>{
             return response.json()
	   	}).then(corpo=>{
	   		alert('titulo_mudanca: ' + corpo[0].titulo_mudanca)
	   		console.log(corpo);
	   	})
  }
*/
  
 </script>
    
</body>

</html>
