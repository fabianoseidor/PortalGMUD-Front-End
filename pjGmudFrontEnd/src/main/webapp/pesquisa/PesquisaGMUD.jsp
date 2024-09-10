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
  <div id="pcoded" class="pcoded">
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
										  	<h5 class="m-b-1">Portal de GMUD - Pesquisa por Mudança</h5>
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
								    <h3 class="text-muted">Pesquisa Mudança <samp id="passo"></samp></h3>
								    <br>
                                    <form class="form-material formCadMudancaPadraoValidacao" action="" method="post" id="formCadMudancaPadrao" enctype="multipart/form-data">
                                          <!-- URL da base da API Base TST ou PRD  -->
                                          <input type="hidden"  name="urlAPI" id="urlAPI" value="<%=session.getAttribute("urlAPI")%>">
			                             
			                              <div class="row">
			                                 <div class="col-sm-12">
											    <!-- Basic Form Inputs card start -->
						                           <!-- Botao para acionar modal -->  
						                           <div class="form-row">
														<!-- Campo Fase do Aditivo -->
														<div class="form-group form-default form-static-label col-md-12 mb-6">
														    <span  class="font-weight-bold font-italic" style="color: #708090">Tipo Pesquisa</span>
															<select name="idTipoPesquisa" id="idTipoPesquisa" class="form-control" required="required" onchange="avaliaTipoPesquisa();">
																<option value="" disabled selected>[-Selecione-]</option>
																<option value="1">Pesquisa Por Título</option>
																<option value="2">Pesquisa ID Normal</option>
																<option value="3">Pesquisa ID Emergencial</option>
																<option value="4">Pesquisa ID Padrão</option>
																<option value="5">Pesquisa GMUD Abertas</option>
																<option value="6">Pesquisa GMUD Aguardando Aprovação</option>
																<option value="7">Pesquisa GMUD Aguardando Execução</option>
																<option value="8">Pesquisa Cliente</option>
															</select> 
														</div>		
										           </div>
			                                 </div>
			                              </div>

			                              <br>
			                              <br>

			                              <div class="row">
			                                 <div class="col-sm-12">
					                           <div class="form-row">
                                                       <div class="form-group form-default form-static-label col-md-12 mb-6">
												       <span class="font-weight-bold font-italic" style="color: #708090">Valor Pesquisado</span>
												       <input style="color: #000000" type="text" name="valorPesquisado" id="valorPesquisado" class="form-control"  placeholder="Informe o valor a ser pesquisado" value=""> 
												    </div>
										       </div>
											 </div>
									      </div>
										  <br>
										  <button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btAddTarefa" id="btAddTarefa" onclick="selecionaPesquisa();">Pesquisar</button>
			                              <br>
			                              <br>
			                               <br>
                                          <!-- Tabela com as informacoes do Recursos a serem cadastrasdos -->                       
										  <div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">

														<div style="height: 800px; overflow: scroll;">
															<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaResult">
																  <thead>
																    <tr class="table-primary">
																      <th scope="col" style="text-align: center; vertical-align: middle;color: white">ID Mudança                  </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Título Mudança              </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Data Criação                </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Data de Execução            </th>
																      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Horario de Inicio da Mudança</th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Data Prevista de Conclusão  </th>
																      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Horario Previsto Conclusão  </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Login User                  </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Status Mudança              </th>
																      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Urgência da mudança         </th>
																      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Impacto da Mudança          </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Tipo de Mudança             </th>
																      <th scope="col" style="vertical-align: middle;color: white"                    >Selecionar                  </th>
																    </tr>
																  </thead>
																<tbody id="tbresult">
							
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										  </div>

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
  
  <div id="box_dark" class="box_dark" > 
     <div class="spinner-border text-info box_modal" ></div>
  </div>

<!-- 
******************************************************************************************************
*
*                                  Modal Buscar Cliente        
*
******************************************************************************************************
-->
  <div class="modal t-modal primary" id="modalClientePesquisa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	 <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	       <div class="modal-header">
	          <h5 class="modal-title" id="exampleModalLabel">Pesquisar Cliente</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	            <span aria-hidden="true">&times;</span>
	          </button>
	       </div>
	       
	       <div class="modal-body">

			  <div class="row">
				 <div class="col-sm-12">
					<div class="card">
					   <div class="card-block">
                          <p class="text-primary h5 font-weight-normal font-italic text-center font-weight-bold">Pesquisa de GMUD por Cliente.</p> 
					   </div>
					</div>
				 </div>
			  </div>

			  <div class="row">
				 <div class="col-sm-12">
					<div class="card">
					   <div class="card-block">
                          <div class="input-group mb-3">
                             <input type="text" id="nomeBuscaCliente" class="form-control" style="color: #000000; margin-right: 15px; font-weight: bold;" placeholder="Digite aqui..." aria-label="Nome Cliente" aria-describedby="basic-addon2">
                             <div class="input-group-append">
                                <button class="btn btn-outline-info" style="border-radius: 25px;" type="button" onclick="pesqusaPorCliente( nomeBuscaCliente.value );">Buscar</button>
                             </div>
                          </div>
                       </div>
					</div>
				 </div>
			  </div>

			  <div class="row">
				 <div class="col-sm-12">
					<div class="card">
						<div class="card-block">
						   <div style="height: 300px; overflow: scroll;">
						      <table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaResutado">
                                 <thead>
                                    <tr>
                                      <th scope="col">#</th>
                                      <th scope="col">ID Cliente</th>
                                      <th scope="col">Nome Cliente</th>
                                      <th scope="col">Selecionar</th>
                                    </tr>
								 </thead>
                                <tbody>
                                </tbody>
							  </table>
						   </div>
						</div>
					</div>
				</div>
              </div>
		   </div>
	       <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	       </div>
	    </div>
	 </div>
  </div>


  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
  <jsp:include page="/util/javascriptfile.jsp"></jsp:include>

  <script type="text/javascript">
  
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function MensagemConfimacaoModal( iconi, tituloPrincipal, textoPrincipal, nomeModal ) {
		  Swal.fire({
			    icon  : iconi                             ,
			    title : tituloPrincipal                   ,
			    text  : textoPrincipal                    ,
			    target: document.getElementById(nomeModal),
			    }
			);	    		
  }
  
  function formatstatusGmud( status ) {
	  switch( status ) {
	    case "ABERTA":
	    	return "Aberta";
	    case "AGUARDANDO_APROVACOES":
	    	return "Aguardando Aprovações";
	    case "APROVADA":
	    	return "Aprovadas";
	    case "CANCELADA":
	    	return "Cancelada";
	    case "REJEITADA":
	    	return "Rejeitada";
	    case "AGUARDANDO_EXECUCAO":
	    	return "Aguardando Execução";
	    case "EM_EXECUCAO":
	    	return "Em Execução";
	    case "MUDANCA_FIM_SUCESSO":
	    	return "Mudança Concluida com Sucesso";
	    case "MUDANCA_FIM_RESSALVA":
	    	return "Mudança Concluida com Ressalva";
	    case "MUDANCA_FIM_FALHA":
	    	return "Mudança Concluida com Falha";
	    case "MUDANCA_ABORTADA":
	    	return "Mudança Concluida com Abortada";
	    case "MUDANCA_ABORTADA_ROLLBACK":
	    	return "Mudança Concluida com Abortada com Rollback";

	}	  
	
  } 

  function selecionaPesquisa() {
//	  let idPesquisaSelececionada = $('#idTipoPesquisa').find ( ":selected").text( ) ;
	  let idPesquisaSelececionada = document.getElementById   ( "idTipoPesquisa").value;
	  let vlrPesq = '';
	  let urlApi  = '';
	  let urlBase = document.getElementById('urlAPI').value;

	  switch(idPesquisaSelececionada) {
	    case "1": //Pesquisa Por Título
	    	 vlrPesq = document.getElementById( 'valorPesquisado').value; 
	    	 if( vlrPesq.trim() == ''){
                 MensagemConfimacao( "warning", "Pesquisa Por Título", "Digite um valor a ser pesquisado!" );
                 break;
	    	 }
//	    	 urlApi = "http://localhost:8090/PortalMudanca/listaMudancaPorTitulo/" + vlrPesq.trim();
	    	 urlApi = urlBase + "listaMudancaPorTitulo/" + vlrPesq.trim();
	    	 getGMUDTitulo(urlApi);
	    	 break;
	    case "2": // Pesquisa ID Normal
	    	 vlrPesq = document.getElementById( 'valorPesquisado').value; 
	    	 if( vlrPesq.trim() == ''){
                 MensagemConfimacao( "warning", "Pesquisa Por ID GMUD Normal", "Digite um valor a ser pesquisado!" );
                 break;
	    	 }
	    	  if (isNaN(vlrPesq)) {
	    		  MensagemConfimacao( "warning", "Pesquisa Por ID GMUD Normal", "Favor informar um valor número para a pesquiza por ID.!" );
	    		  break;
	    	  } 
//	    	 urlApi = "http://localhost:8090/PortalMudanca/pesquisaMudancaNormal/" + vlrPesq.trim();
	    	 urlApi = urlBase + "pesquisaMudancaNormal/" + vlrPesq.trim();

	    	 getGMUDTituloPorId(urlApi);
	    	 break;
	    case "3": // Pesquisa ID Emergencial
	    	 vlrPesq = document.getElementById( 'valorPesquisado').value; 
	    	 if( vlrPesq.trim() == ''){
                 MensagemConfimacao( "warning", "Pesquisa Por ID GMUD Emergencial", "Digite um valor a ser pesquisado!" );
                 break;
	    	 }
	    	  if (isNaN(vlrPesq)) {
	    		  MensagemConfimacao( "warning", "Pesquisa Por ID GMUD Emergencial", "Favor informar um valor número para a pesquiza por ID.!" );
	    		  break;
	    	  } 
//	    	 urlApi = "http://localhost:8090/PortalMudanca/pesquisaMudancaEmergencial/" + vlrPesq.trim();
	    	 urlApi = urlBase + "pesquisaMudancaEmergencial/" + vlrPesq.trim();

	    	 getGMUDTituloPorId(urlApi);
	    	 break;
	    case "4": // Pesquisa ID Padrão
	    	 vlrPesq = document.getElementById( 'valorPesquisado').value; 
	    	 if( vlrPesq.trim() == ''){
                 MensagemConfimacao( "warning", "Pesquisa Por ID GMUD Padrão", "Digite um valor a ser pesquisado!" );
                 break;
	    	 }
	    	  if (isNaN(vlrPesq)) {
	    		  MensagemConfimacao( "warning", "Pesquisa Por ID GMUD Padrão", "Favor informar um valor número para a pesquiza por ID.!" );
	    		  break;
	    	  } 
//	    	 urlApi = "http://localhost:8090/PortalMudanca/pesquisaMudancaPadrao/" + vlrPesq.trim();
	    	 urlApi = urlBase + "pesquisaMudancaPadrao/" + vlrPesq.trim();

	    	 getGMUDTituloPorId(urlApi);
	    	 break;
	    	 break;
	    case "5": // Pesquisa GMUD Abertas ==> ABERTA
//	         urlApi = "http://localhost:8090/PortalMudanca/listaMudancaPorStatus/ABERTA";
	    	 urlApi = urlBase + "listaMudancaPorStatus/ABERTA/";
	    	 getGMUDTitulo(urlApi);
	    	 break;
	    case "6": // Pesquisa GMUD Aguardando Aprovação ==> AGUARDANDO_APROVACOES
//	         urlApi = "http://localhost:8090/PortalMudanca/listaMudancaPorStatus/AGUARDANDO_APROVACOES";
	         urlApi = urlBase + "listaMudancaPorStatus/AGUARDANDO_APROVACOES/";
	    	 getGMUDTitulo(urlApi);
	    	 break;
        case "7": // Pesquisa GMUD Aguardando Execu ==> AGUARDANDO_EXECUCAO
//          urlApi = "http://localhost:8090/PortalMudanca/listaMudancaPorStatus/AGUARDANDO_EXECUCAO";
            urlApi = urlBase + "listaMudancaPorStatus/AGUARDANDO_EXECUCAO/";
            getGMUDTitulo(urlApi);
            break;
	    case "8": // Pesquisa GMUD Aguardando Execução ==> AGUARDANDO_EXECUCAO
	    	const clientePsq = document.getElementById('valorPesquisado').value;
	    	pesqusaPorCliente( clientePsq );
	    	 break;
	    default:
	    	 MensagemConfimacao( "warning", "Pesquisa GMUD", "Selecione um Tipo de Pesquisar e Digite um valor a ser pesquisado!" );	 
	}	  
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  async function pesqusaPorCliente( clientePsq ) {
	  try {
		  showLoading();
		  let urlBase     = document.getElementById('urlAPI').value;		  
		  const urlApiCli = urlBase + "getListClientesAfetados/" + clientePsq;

		  $("#nomeBuscaCliente").val( clientePsq );
		  
		  const listaCliente = await fetch(urlApiCli, { method: 'GET', headers: { 'Content-Type': 'application/json'} })
                                          .then(response => response.text())
                                          .then(body => { return body; });
		  var resultadoJoson = JSON.parse( listaCliente );
          if( resultadoJoson.length > 0 ){
        	  await listaClientePesq( resultadoJoson );
        	  $('#modalClientePesquisa').modal('show'); // Abrir Modal        	  
          }else
             MensagemConfimacao( "info", "Pesquisa Cliente", "Não foi encontrado nenhum cliente com este nome '" + clientePsq + "''" ); 

          hideLoading();
          
	  } catch (error) {
	      hideLoading();
	     // MensagemConfimacaoModal("error", "Pesquisa Cliente", "Erro pesquisa Cliente:" + error, "modalClientePesquisa");
	      MensagemConfimacao("error", "Pesquisa Cliente", "Erro pesquisa Cliente:" + error );
	  }	
	
  }
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function listaClientePesq( listaCliente ) {
	  
      $('#tabelaResutado > tbody > tr').remove();
      let urlPesquisa = '';
      const urlBase      = document.getElementById('urlAPI').value;
      for(var p = 0; p < listaCliente.length; p++){
    	  urlPesquisa = urlBase + "getlistaMudancaClienteAfetados/" + listaCliente[p].id_clientes_af;
          $('#tabelaResutado > tbody').append('<tr> <td>' + (p+1) + '</td> <td>'+ listaCliente[p].id_clientes_af + '</td> <td>'+listaCliente[p].nome_cliente+'</td> <td><button style="border-radius: 25px;" onclick="MontaTelaPorCliente(' + '\'' + urlPesquisa + '\'' + ');" type="button" class="btn btn-info">Selecionar</button></td></tr>');
      }
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  async function MontaTelaPorCliente( urlApiCliPsquisado ) {
	  try {
		  showLoading();
		  
		  const listaCliente = await fetch(urlApiCliPsquisado, { method: 'GET', headers: { 'Content-Type': 'application/json'} })
                                          .then(response => response.text())
                                          .then(body => { return body; });
		  var resultadoJoson = JSON.parse( listaCliente );
          if( resultadoJoson.length > 0 ){
        	  montaTabelaGMUD( resultadoJoson )
          }else
             MensagemConfimacaoModal("info", "Pesquisa GMUD Cliente", "Não foi encontrado GMUD associada para este Cliente!", "modalClientePesquisa");

          hideLoading();
          
	  } catch (error) {
	      hideLoading();
	      MensagemConfimacaoModal("error", "Pesquisa Cliente", "Erro pesquisa Cliente:" + error, "modalClientePesquisa");
	      // MensagemConfimacao("error", "Pesquisa Cliente", "Erro pesquisa Cliente:" + error );
	  }	
	
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function avaliaTipoPesquisa() {

	  let idPesqSelec = document.getElementById   ( "idTipoPesquisa").value;
	  
	  if( idPesqSelec !== "5" && idPesqSelec !== "6" && idPesqSelec !== "7" ){
		  $('#personagem').attr('disabled', false);
	  }else{
		  $("#valorPesquisado").val("");
		  $('#valorPesquisado').attr('disabled', true);
	  }
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function formatData( tipo, data ) {

	const dtFormat = formatDataStr( data );
	  
	const dataCriada = new Date(dtFormat);
	let dataFormatada;
    if( tipo === 1){
        dataFormatada = dataCriada.toLocaleDateString('pt-BR', {timeZone: 'UTC',}); // Saida: 21/08/1988
    }else{
	    dataFormatada = dataCriada.toLocaleString('pt-BR', { timezone: 'UTC' }); // Saida: 20/10/2023 07:11:08
    }
	return dataFormatada;
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function formatDuracao( duracao ) { 
	let tam = duracao.length;
	let durFort = '';
	for( let i = 0; i < tam; i++ ){
		let min = duracao[i].toString();
		
		if( min.length === 1 ) min = '0' + min;
		durFort = durFort + min;
		if( i < ( tam -1 ) )durFort = durFort + ':';
    }
	return durFort;
	
  }
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
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
  
  
  function montaTabelaGMUD( listMudanca ) {

		let tbody = document.getElementById('tbresult');
		tbody.innerText = '';
		for(let i = 0; i < listMudanca.length; i++){

			let tr = tbody.insertRow();

			let td_idMudanca              = tr.insertCell();    
			let td_tituloMudanca          = tr.insertCell();    
			let td_dataCriacao            = tr.insertCell();    
			let td_dtExecucao             = tr.insertCell();
			let td_HrIniMudana            = tr.insertCell();
			let td_dtPrevistaConclusao    = tr.insertCell();
			let td_hrPrevistoConcluso     = tr.insertCell();
			let td_loginUser              = tr.insertCell();    
			let td_statusMudanca          = tr.insertCell();    
			let td_UrgenciaMudanca        = tr.insertCell(); 
			let td_ImpMudanca             = tr.insertCell();
			let td_tipoMudanca            = tr.insertCell(); 
			let td_Selecionar             = tr.insertCell();     
			
	        let hr_inicio = ' - ';
	        let hr_final  = ' - ';
	        if( listMudanca[i].dadosMudanca.hr_inicio !== undefined )
	        	hr_inicio = formatDuracao( listMudanca[i].dadosMudanca.hr_inicio );
	        if( listMudanca[i].dadosMudanca.hr_final !== undefined )
	        	hr_final = formatDuracao( listMudanca[i].dadosMudanca.hr_final );

			// Preenche a tabela com os valores retornados da API
			td_idMudanca.innerText           = listMudanca[i].id_mudanca;                
			td_tituloMudanca.innerText       = listMudanca[i].titulo_mudanca;            
			td_dataCriacao.innerText         = ( listMudanca[i].dt_criacao !== null ? formatData( 2, listMudanca[i].dt_criacao ) : ' - ' );       
			td_dtExecucao.innerText          = ( listMudanca[i].dadosMudanca.dt_inicio !== null ? formatData( 1,  listMudanca[i].dadosMudanca.dt_inicio ) : ' - '     );            
			td_HrIniMudana.innerText         = ( hr_inicio                          === ' - ' ? hr_inicio                                           : hr_inicio );           
			td_dtPrevistaConclusao.innerText = ( listMudanca[i].dadosMudanca.dt_final  !== null ? formatData( 1, listMudanca[i].dadosMudanca.dt_final )   : ' - '     );
			td_hrPrevistoConcluso.innerText  = ( hr_final                           === ' - ' ? hr_final                                            : hr_final  );  
			td_loginUser.innerText           = listMudanca[i].login_user;                
			td_statusMudanca.innerText       = formatstatusGmud( listMudanca[i].statusMudanca );            
			td_UrgenciaMudanca.innerText     = listMudanca[i].criticidade.criticidade;       
			td_ImpMudanca.innerText          = listMudanca[i].impactoMudanca.impacto_mudanca;            
			td_tipoMudanca.innerText         = listMudanca[i].tipoMudanca.tipo_mudanca;           
			
			
			if (listMudanca[i].dt_aprovacao === null)td_dt_aprovacao.classList.add('center');
			// Centraliza celula
			td_idMudanca.classList.add          ('center');
			td_ImpMudanca.classList.add         ('center');
			td_HrIniMudana.classList.add        ('center');
			td_hrPrevistoConcluso.classList.add ('center');
			td_UrgenciaMudanca.classList.add    ('center');
			td_dtExecucao.classList.add         ('center');
			td_dtPrevistaConclusao.classList.add('center');
			///////////////////////////////////////////////////////////////////////
			td_idMudanca.setAttribute          ('style', 'vertical-align: middle' );
			td_tituloMudanca.setAttribute      ('style', 'vertical-align: middle' );
			td_dataCriacao.setAttribute        ('style', 'vertical-align: middle' );
			td_dtExecucao.setAttribute         ('style', 'vertical-align: middle' );         
			td_HrIniMudana.setAttribute        ('style', 'vertical-align: middle' );           
			td_dtPrevistaConclusao.setAttribute('style', 'vertical-align: middle' );
			td_hrPrevistoConcluso.setAttribute ('style', 'vertical-align: middle' ); 
			td_loginUser.setAttribute          ('style', 'vertical-align: middle' );      
			td_statusMudanca.setAttribute      ('style', 'vertical-align: middle' );
			td_UrgenciaMudanca.setAttribute    ('style', 'vertical-align: middle' );
			td_ImpMudanca.setAttribute         ('style', 'vertical-align: middle' );
			td_tipoMudanca.setAttribute        ('style', 'vertical-align: middle' );		
            ///////////////////////////////////////////////////////////////////////
            let imgliberar = document.createElement('img');
            imgliberar.src = getContextPath() +'/imagens/visualizar-arquivo-35.png';
            let funcLib = "goToPesquisa(" + listMudanca[i].id_mudanca + "," + listMudanca[i].tipoMudanca.id_tipo_mudanca + ")";
            imgliberar.setAttribute('onclick', funcLib );
            imgliberar.setAttribute('data-toggle', 'tooltip' );
            imgliberar.setAttribute('data-placement', 'top' );
            imgliberar.setAttribute('title', 'Visualizar GMUD!' );                        
            td_Selecionar.appendChild(imgliberar);
            td_Selecionar.classList.add('center');					
		}	
  }
  
 /******************************************************************/
 /*                                                                */
 /*                                                                */
 /******************************************************************/
  function getGMUDTitulo(urlAPI){

		$.ajax({
			method     : "GET"                             ,
			url        : urlAPI                            ,
			contentType: "application/json; charset=utf-8" ,
			beforeSend: function( xhr ) {
				   showLoading();
				},
			success    : function(response) {
				
				if( response.error !== undefined ){
				    MensagemConfimacao( "warning", "Pesquisa GMUD", response.error );
			    }else{
                    montaTabelaGMUD( response )
			    }
				hideLoading()
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao Listar Mudanças: " + xhr.responseText);
			hideLoading()
			MensagemConfimacao( "error", "Tarefas", "Erro ao Listar Mudanças: " + xhr.responseText ) ;
		});		
  }
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function goToPesquisa( idMudanca, tipoMudanca ) {
	let botaoURL = '';
	if( tipoMudanca === 1 ){
	    botaoURL = getContextPath() + '/manutencao/manutNormal.jsp?idMudanca=' + idMudanca;
	}else if( tipoMudanca === 2 ){
			  botaoURL = getContextPath() + '/manutencao/manutEmergencial.jsp?idMudanca=' + idMudanca;
	}else if( tipoMudanca === 3 ){
			  botaoURL = getContextPath() + '/manutencao/manutPadrao.jsp?idMudanca=' + idMudanca;
	}

  	window.location.href = botaoURL;
  } 

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function getGMUDTituloPorId(urlAPI){

		$.ajax({
			method     : "GET"                             ,
			url        : urlAPI                            ,
			contentType: "application/json; charset=utf-8" ,
			beforeSend: function( xhr ) {
				   showLoading();
				},
			success    : function(response) {
				// console.log( "length: " + response.length );
				
				if( response.error !== undefined ){
				    MensagemConfimacao( "warning", "Pesquisa GMUD", response.error );
			    }else{

					let tbody = document.getElementById('tbresult');
					tbody.innerText = '';
					let tr = tbody.insertRow();

					let td_idMudanca              = tr.insertCell();    
					let td_tituloMudanca          = tr.insertCell();    
					let td_dataCriacao            = tr.insertCell();    
					let td_dtExecucao             = tr.insertCell();
					let td_HrIniMudana            = tr.insertCell();
					let td_dtPrevistaConclusao    = tr.insertCell();
					let td_hrPrevistoConcluso     = tr.insertCell();
					let td_loginUser              = tr.insertCell();    
					let td_statusMudanca          = tr.insertCell();    
					let td_UrgenciaMudanca        = tr.insertCell(); 
					let td_ImpMudanca             = tr.insertCell();
					let td_tipoMudanca            = tr.insertCell(); 
					let td_Selecionar             = tr.insertCell();     

			        let hr_inicio = ' - ';
			        let hr_final  = ' - ';
			        if( response.dadosMudanca.hr_inicio !== undefined )
			        	hr_inicio = formatDuracao( response.dadosMudanca.hr_inicio );
			        if( response.dadosMudanca.hr_final !== undefined )
			        	hr_final = formatDuracao( response.dadosMudanca.hr_final );

					// Preenche a tabela com os valores retornados da API
					td_idMudanca.innerText           = response.id_mudanca;                
					td_tituloMudanca.innerText       = response.titulo_mudanca;            
					td_dataCriacao.innerText         = ( response.dt_criacao             !== null ? formatData( 2, response.dt_criacao )              : ' - '     );       
					td_dtExecucao.innerText          = ( response.dadosMudanca.dt_inicio !== null ? formatData( 1,  response.dadosMudanca.dt_inicio ) : ' - '     );            
					td_HrIniMudana.innerText         = ( hr_inicio                          === ' - ' ? hr_inicio                                           : hr_inicio );           
					td_dtPrevistaConclusao.innerText = ( response.dadosMudanca.dt_final  !== null ? formatData( 1, response.dadosMudanca.dt_final )   : ' - '     );
					td_hrPrevistoConcluso.innerText  = ( hr_final                           === ' - ' ? hr_final                                            : hr_final  );  
					td_loginUser.innerText           = response.login_user;                
					td_statusMudanca.innerText       = formatstatusGmud( response.statusMudanca );            
					td_UrgenciaMudanca.innerText     = response.criticidade.criticidade;       
					td_ImpMudanca.innerText          = response.impactoMudanca.impacto_mudanca;            
					td_tipoMudanca.innerText         = response.tipoMudanca.tipo_mudanca;           
										
					
					if (response.dt_aprovacao === null)td_dt_aprovacao.classList.add('center');
					// Centraliza celula
					td_idMudanca.classList.add          ('center');
					td_ImpMudanca.classList.add         ('center');
					td_HrIniMudana.classList.add        ('center');
					td_hrPrevistoConcluso.classList.add ('center');
					td_UrgenciaMudanca.classList.add    ('center');
					td_dtExecucao.classList.add         ('center');
					td_dtPrevistaConclusao.classList.add('center');
					///////////////////////////////////////////////////////////////////////
					td_idMudanca.setAttribute          ('style', 'vertical-align: middle' );
					td_tituloMudanca.setAttribute      ('style', 'vertical-align: middle' );
					td_dataCriacao.setAttribute        ('style', 'vertical-align: middle' );
					td_dtExecucao.setAttribute         ('style', 'vertical-align: middle' );         
					td_HrIniMudana.setAttribute        ('style', 'vertical-align: middle' );           
					td_dtPrevistaConclusao.setAttribute('style', 'vertical-align: middle' );
					td_hrPrevistoConcluso.setAttribute ('style', 'vertical-align: middle' ); 
					td_loginUser.setAttribute          ('style', 'vertical-align: middle' );      
					td_statusMudanca.setAttribute      ('style', 'vertical-align: middle' );
					td_UrgenciaMudanca.setAttribute    ('style', 'vertical-align: middle' );
					td_ImpMudanca.setAttribute         ('style', 'vertical-align: middle' );
					td_tipoMudanca.setAttribute        ('style', 'vertical-align: middle' );		
                    ///////////////////////////////////////////////////////////////////////
		            let imgliberar = document.createElement('img');
		            imgliberar.src = getContextPath() +'/imagens/visualizar-arquivo-35.png';
		            let funcLib = "goToPesquisa(" + response.id_mudanca + "," + response.tipoMudanca.id_tipo_mudanca + ")";
                    imgliberar.setAttribute('onclick', funcLib );
                    imgliberar.setAttribute('data-toggle', 'tooltip' );
                    imgliberar.setAttribute('data-placement', 'top' );
                    imgliberar.setAttribute('title', 'Visualizar GMUD!' );                        
                    td_Selecionar.appendChild(imgliberar);
                    td_Selecionar.classList.add('center');					
					
			    }
				hideLoading()
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao Listar Mudanças: " + xhr.responseText);
			MensagemConfimacao( "error", "Tarefas", "Erro ao Listar Mudanças po ID: " + xhr.responseText ) ;
			hideLoading()
		});		
}

  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function getContextPath() {
      return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
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
 
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function showLoading(){
//		alert('longin');
	 $("#box_dark").css('display','flex');
		
  }

  function hideLoading(){
	 $("#box_dark").css('display','none');
  }  
  </script>
    
</body>

</html>
