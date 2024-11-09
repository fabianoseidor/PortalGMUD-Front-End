<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <jsp:include page="/util/head.jsp"></jsp:include>

   <style>
	  td{
	       white-space: pre-wrap;
	    }

       .mesmo-tamanho-botao {
           width: 15%;
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
            background-color: #B0C4DE;
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
       .error-text{
         font-size:12px;
         color: red;
       }
       
       .center{
          text-align: center;
       }
   
	   .box_dark{
		  position: fixed;
		  left: 0;
		  top: 0;
		  width: 100vw;
		  height: 100vw;
		  background: rgba(0,0,0,.7);
		  display: none;
	   }

	   .box_modal{
		   background: #FFF;
		   padding: 15px;
		   position: relative;
		   top: 60ex;
		   left: 50%;
	  }
   </style>
   

  <body>
  <!-- Pre-loader start -->
  <jsp:include page="/util/theme-loader.jsp"></jsp:include>
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded" >
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          
          <!-- Chamada para o Menu de Barras -->
          <jsp:include page="/util/navbarheader.jsp"></jsp:include>
          
          <div class="pcoded-main-container">
             <div class="pcoded-wrapper">
                  <!-- Page-header start -->
				   <div class="page-header">
				       <div class="page-block">
				           <div class="row align-items-center">
				               <div class="col-md-12">
				                   <div class="page-header-title">

									   <div class="row">
										  <div class="col-lg-10">
										  	<h5 class="m-b-1">Portal de GMUD - Aprovação de Mudança</h5>
										  </div>
										  <div class="col-lg-2 text-left">
										    <a class="btn btn-primary" href="<%= request.getContextPath() %>/principal/telaPrincipal.jsp" style="border-radius: 25px;" role="button" style="color: white;">Voltar</a>
										  </div>
									   </div>	
									   			                   
				                   </div>
				               </div>				       
				           </div>
				       </div>
				   </div>
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
								    <h3 class="text-muted">Aprovação de Mudança <samp id="passo"></samp></h3>
								    
								    <div id="box_dark" class="box_dark" > 
								         <div class="spinner-border text-info box_modal" ></div>
								    </div>
								    
								    <br>
                                    <form class="form-material formCadMudancaPadraoValidacao" action="" method="post" id="formCadMudancaPadrao" enctype="multipart/form-data">
                                        <!-- URL da base da API Base TST ou PRD  -->
                                        <input type="hidden" name="urlAPI"    id="urlAPI"    value="<%=session.getAttribute("urlAPI")%>">
                                        <input type="hidden" name="loginUser" id="loginUser" value="<%=session.getAttribute("usuario")%>">
<!-- 

										<div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-block">
-->
														<div style="height: 800px; overflow: scroll;">
															<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaAprovacao">
																  <thead>
																    <tr class="table-primary">
																      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Detalhe Mudança</th>
																      <th scope="col" style="text-align: center; vertical-align: middle;color: white">ID Mudança     </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Título Mudança </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Tipo GMUD      </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Data Criação   </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Aprovador      </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Status         </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Data Aprovação </th>
																      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Aprovação      </th>
																      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Reprovar       </th>
																    </tr>
																  </thead>
																<tbody id="tbAprovacao">
							
																</tbody>
															</table>
														</div>
<!-- 							
													</div>
												</div>
											</div>
										</div>
-->
                                     </form>
                                 </div>
                              </div>
                              <br>
                              <br>
                              
                        
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
  
  <jsp:include page="modalAprovacao.jsp"></jsp:include> 
  
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/loanding.js"></script> 
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/modalAprovacao.js"></script> 
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
  <jsp:include page="/util/javascriptfile.jsp"></jsp:include>

  <script type="text/javascript">
  ListarGemuds();
  function ListarGemuds(){
		 let urlBase   = document.getElementById('urlAPI').value;
		 let urlAPI    = urlBase + 'listaMudancaAprovadocao';
		 let loginTela = document.getElementById('loginUser').value;
		
		$.ajax({
			method     : "GET"                                                        ,
//			url        : "http://localhost:8090/PortalMudanca/listaMudancaAprovadocao",
			url        : urlAPI,
			contentType: "application/json; charset=utf-8"                            ,
			success    : function(response) {
				
//				console.log(response);

				let tbody = document.getElementById('tbAprovacao');
				tbody.innerText = '';
				for(let i = 0; i < response.length; i++){
					let tr = tbody.insertRow();

					let td_detalhe_mudanca      = tr.insertCell();
					let td_id_mudanca           = tr.insertCell();
					let td_titulo_mudanca       = tr.insertCell();
					let td_tipo_mudanca         = tr.insertCell();
					let td_dt_criacao_mudanca   = tr.insertCell();
					let td_aprovador            = tr.insertCell();
					let td_statusAprovacao      = tr.insertCell();
					let td_dt_aprovacao         = tr.insertCell();
					let td_aprovar              = tr.insertCell();
					let td_reprovar             = tr.insertCell();	
                    ///////////////////////////////////////////////////////////////////////
					td_detalhe_mudanca.setAttribute   ('style', 'vertical-align: middle' );
					td_id_mudanca.setAttribute        ('style', 'vertical-align: middle' );
					td_titulo_mudanca.setAttribute    ('style', 'vertical-align: middle' );
					td_tipo_mudanca.setAttribute      ('style', 'vertical-align: middle' );
					td_dt_criacao_mudanca.setAttribute('style', 'vertical-align: middle' );
					td_aprovador.setAttribute         ('style', 'vertical-align: middle' );
					td_statusAprovacao.setAttribute   ('style', 'vertical-align: middle' );
					td_dt_aprovacao.setAttribute      ('style', 'vertical-align: middle' );
					td_aprovar.setAttribute           ('style', 'vertical-align: middle' );
					td_reprovar.setAttribute          ('style', 'vertical-align: middle' );
                    ///////////////////////////////////////////////////////////////////////
                    
					// Preenche a tabela com os valores retornados da API
		            let imgdetalhe = document.createElement('img');
		            imgdetalhe.src = getContextPath() +'/imagens/mostrar-propriedade.-48.png';
		            imgdetalhe.setAttribute('style', 'cursor:pointer;' );
		            td_detalhe_mudanca.appendChild(imgdetalhe);
		            td_detalhe_mudanca.classList.add('center');
		            imgdetalhe.setAttribute('data-toggle', 'tooltip' );
		            imgdetalhe.setAttribute('data-placement', 'top' );
		            imgdetalhe.setAttribute('title', 'Detalhe Mudança ID ' + response[i].id_mudanca ); 
		            imgdetalhe.setAttribute('onclick', "showDetalhe( " + response[i].id_mudanca + ", '" + response[i].tipo_mudanca + "')" );
                    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    
					td_id_mudanca.innerText           = response[i].id_mudanca;
					td_titulo_mudanca.innerText       = response[i].titulo_mudanca;
					td_tipo_mudanca.innerText         = response[i].tipo_mudanca;
					td_dt_criacao_mudanca.innerText   = formatData( response[i].dt_criacao_mudanca ); 
					td_aprovador.innerText            = response[i].aprovador;
					td_statusAprovacao.innerText      = ( response[i].statusAprovacao === false ? 'Aguardando Aprovação' : 'Aprovada' );
					td_dt_aprovacao.innerText         = ( response[i].dt_aprovacao !== null ? formatData( response[i].dt_aprovacao ) : ' - ' );
                    
					if (response[i].dt_aprovacao === null)td_dt_aprovacao.classList.add('center');
					// Centraliza celula
					td_id_mudanca.classList.add     ('center');

		            let imgliberar = document.createElement('img');
		            imgliberar.src = getContextPath() +'/imagens/aprovado-48.png';
		            imgliberar.setAttribute('style', 'cursor:pointer;' );
		            let funcLib = "atualizaStatus( " + response[i].id_lista_aprovadores + ", " + response[i].id_mudanca + " )";
                    td_aprovar.appendChild(imgliberar);
                    td_aprovar.classList.add('center');

                    
		            let imgreprovar = document.createElement('img');
		            imgreprovar.src = getContextPath() +'/imagens/polegares-para-baixo-40.png';
		            imgreprovar.setAttribute('style', 'cursor:pointer;' );
		            let funcLibRepro = "reprovacaoGMUD( " + response[i].id_lista_aprovadores + ", " + response[i].id_mudanca + " )";
                    td_reprovar.appendChild(imgreprovar);
                    td_reprovar.classList.add('center');

                                        
                    if( response[i].statusAprovacao ){
    		            imgreprovar.setAttribute('onclick', 'aprovacaoMsgJaReprovada()' );
                        imgliberar.setAttribute ('onclick', 'aprovacaoMsgJaAprovada()'  );
                  	    
                        imgliberar.setAttribute('data-toggle', 'tooltip' );
                        imgliberar.setAttribute('data-placement', 'top' );
                        imgliberar.setAttribute('title', 'A tarefa já foi Aprovada!' );   
                        
    		            imgreprovar.setAttribute('data-toggle', 'tooltip' );
    		            imgreprovar.setAttribute('data-placement', 'top' );
    		            imgreprovar.setAttribute('title', 'A tarefa já foi Aprovada!' );                        

                     }else{

                    	 if( loginTela === response[i].login_aprovador ){
	     		             imgreprovar.setAttribute('onclick', funcLibRepro );
	                         imgliberar.setAttribute('onclick', funcLib );
	                        
	                         imgliberar.setAttribute('data-toggle', 'tooltip' );
	                         imgliberar.setAttribute('data-placement', 'top' );
	                         imgliberar.setAttribute('title', 'Aprovar GMUD!' );                        
	     		             
	                         imgreprovar.setAttribute('data-toggle', 'tooltip' );
	    		             imgreprovar.setAttribute('data-placement', 'top' );
	    		             imgreprovar.setAttribute('title', 'Reprovar GMUD!' ); 
                    	 }else{
                    		 imgreprovar.setAttribute('onclick', "mensagemNaoResponsavel( '" + response[i].aprovador + "')" );
	                         imgliberar.setAttribute ('onclick', "mensagemNaoResponsavel( '" + response[i].aprovador + "')" );
	                        
	                         imgliberar.setAttribute('data-toggle', 'tooltip' );
	                         imgliberar.setAttribute('data-placement', 'top' );
	                         imgliberar.setAttribute('title', 'Você não tem permissão de Aprovação!' );                        
	     		             
	                         imgreprovar.setAttribute('data-toggle', 'tooltip' );
	    		             imgreprovar.setAttribute('data-placement', 'top' );
	    		             imgreprovar.setAttribute('title', 'você não tem permissão para Reprovar!' ); 
                    	 }
                     }
  
				}
 				
			}
		}).fail(function(xhr, status, errorThrown) {
			//alert("Erro ao Listar Mudanças: " + xhr.responseText);
			MensagemConfimacao( "error", "Listar GMUD", "Erro ao Listar Mudanças: " + xhr.responseText ) ;   
		});		
  }
  
  /////////////////////////////////////////////////////
  //   Chama funcao para mostrar modal               //
  /////////////////////////////////////////////////////
  function showDetalhe( idMudanca, tipoGMUD ) {
	  let urlBase = document.getElementById('urlAPI').value;
	  let urlApi  = '';
	  if( tipoGMUD === 'NORMAL' ){
		  urlApi = urlBase + "pesquisaMudancaNormal/" + idMudanca;
		}else if( tipoGMUD === 'EMERGENCIAL' ){
			urlApi = urlBase + "pesquisaMudancaEmergencial/" + idMudanca;
		}else if( tipoGMUD === 'PADRÃO' ){
			urlApi = urlBase + "pesquisaMudancaPadrao/" + idMudanca; 
		}	  
	  getGMUDTituloPorId( urlApi );	 
  }
  

  
  function mensagemNaoResponsavel( usuaro ) {
	  MensagemConfimacao( "error", "Aprovação de Tarefa", 'você não tem permissão de aprovação/rejeção nesta GMUD. Somente o usuario "' + usuaro + "'");
  }
  
  function atualizaStatus( idListaAprovadores, idMudanca ){
		let urlBase = document.getElementById('urlAPI').value;
		let urlAPI  = urlBase + 'aprovacaoGMUD/';
		showLoading();
		$.ajax({
			method : "POST",
//			url : "http://localhost:8090/PortalMudanca/aprovacaoGMUD/" + idListaAprovadores + "/" + idMudanca,
			url : urlAPI + idListaAprovadores + "/" + idMudanca,
			contentType : "application/json; charset=utf-8",
			success : function(response) {

				console.log("response: " + response);
				
				let msg = "";
				if( response === 'sucesso' ){
					msg = "Status da GMUD " + idMudanca + " Atualizada com Sucesso!";
				    MensagemConfimacao("success","Atualização Status", msg);
				}else {
					msg = "ERRO: Atualização do Status da GMUD " + idMudanca + "!";
					MensagemConfimacao("error","Atualização Status", msg);
                   }
				
				ListarGemuds();
				hideLoading()
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao salvar usuario: " + xhr.responseText);
			MensagemConfimacao( "error", "Status GMUD", "Erro ao Atualiza Status da GMUD: " + xhr.responseText) ;  
			hideLoading();
		});
  }
  
  async function reprovacaoGMUD( idListaAprovadores, idMudanca ){
	  
	  const { value: text } = await Swal.fire({
		  input: "textarea",
		//  inputLabel: "Motivo reprovação!",
		  title: "Motivo reprovação!",
		  inputPlaceholder: "Motivo reprovação...",
		  inputAttributes: {
		    "aria-label": "Motivo reprovação!"
		  },
		  showCancelButton: true,
		  confirmButtonText: "Reprovar",
		  denyButtonText   : "Cancelar"

		});
		if (text) {
		//  Swal.fire(text);
			let urlBase = document.getElementById('urlAPI').value;
			let urlAPI  = urlBase + 'reprovacaoGMUD/';
			showLoading();
			
			let dados = {
					motivo_rejeicao      : text,
					id_lista_aprovadores : idListaAprovadores                   ,
					id_mudanca           : idMudanca
			};  
			
			$.ajax({
				method : "POST",
//				url : "http://localhost:8090/PortalMudanca/reprovacaoGMUD/" + idListaAprovadores + "/" + idMudanca,
//				url : urlBase + idListaAprovadores + "/" + idMudanca,
				url : urlAPI,
				contentType : "application/json; charset=utf-8",
				data        : JSON.stringify(dados)            ,
				success : function(response) {

		//			console.log("response: " + response);
					
					let msg = "";
					if( response === 'sucesso' ){
						msg = "Status da GMUD " + idMudanca + ", GMUD foi Rejeitada e Cancelada!";
					    MensagemConfimacao("warning","Atualização Status", msg);
					}else {
						msg = "ERRO: Atualização do Status da GMUD " + idMudanca + "!";
						MensagemConfimacao("error","Atualização Status", msg);
	                   }
					
					ListarGemuds();
					hideLoading();
				}
			}).fail(function(xhr, status, errorThrown) {
				//alert("Erro ao salvar usuario: " + xhr.responseText);
				hideLoading();
				MensagemConfimacao( "error", "Status GMUD", "Erro ao Reprovar GMUD: " + xhr.responseText) ; 
			});

		}
    }

   
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function getContextPath() {
  return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
  }
  
  function aprovacaoMsgJaAprovada() {
	  MensagemConfimacao( "info", "Aprovação de Tarefa", "Esta Tarefa já foi Aprovada" );
  }
  
  function aprovacaoMsgJaReprovada() {
	  MensagemConfimacao( "info", "Aprovação de Tarefa", "Esta Tarefa já foi Aprovada e não pode mais ser Reprovada!" );
  }

  function formatDataStr( data ) {
		let tam    = data.length;
		let dtFort;
	    
		if( tam === 5 ){
			dtFort = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' + '00';
	    }else if( tam === 7 ){
			dtFort = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' +data[5];
	    }else dtFort = data;
		
		return dtFort;
	 
  }
 
  function formatData( data ) {
    
	let dtFormt = formatDataStr( data );
	  
	const dataCriada = new Date(dtFormt);
//		const dataFormatada = dataCriada.toLocaleDateString('pt-BR', {timeZone: 'UTC',}); // Saida: 21/08/1988
	const dataFormatada = dataCriada.toLocaleString('pt-BR', { timezone: 'UTC' }); // Saida: 20/10/2023 07:11:08
	return dataFormatada;
  }

  function MensagemConfimacao( iconi, tituloPrincipal, textoPrincipal ) {
	// icon
//		  	"warning"
//		  	"error"
//		  	"success"
//		  	"info"

			  Swal.fire({
				    icon  : iconi                             ,
				    title : tituloPrincipal                   ,
				    text  : textoPrincipal                    ,
				    }
				);
			
	}
 
  
  </script>
    
</body>

</html>
