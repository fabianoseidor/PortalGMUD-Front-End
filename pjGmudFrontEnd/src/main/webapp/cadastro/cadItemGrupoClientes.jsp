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
       
       .conteiner-modal{
           background-color: red;

/*
           display:flex;
           justify-content: center;
           align-items: center;
*/           
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
				         <div class="col-md-8">
				            <div class="page-header-title">
							   <div class="row">
							      <div class="col-lg-10"> <h5 class="m-b-1">Portal de GMUD - Cadastro de Clientes no Grupo</h5> </div>
								  <div class="col-lg-2 text-left"> <a class="btn btn-primary" href="<%= request.getContextPath() %>/principal/telaPrincipal.jsp" style="border-radius: 25px;" role="button" style="color: white;">Voltar</a> </div>
							   </div>				                   
				            </div>
				         </div>				       
				      </div>
				   </div>
				</div>
				
                <!-- Page-header end -->
                <div class="pcoded-inner-content d-flex justify-content-center" >
                   <!-- Main-body start -->
                   <div class="main-body">
                      <div class="page-wrapper">
                         <div class="page-body">
                            <div class="row">
                            
                               <form class="form-material d-flex justify-content-center align-items-top vw-100" action="" method="post" id="formCaditensGrupoClientes">
                               
                                  <div class="col-sm-8">
								     <h3 class="text-muted d-flex justify-content-center">Cadastro de Clientes no Grupo<samp id="passo"></samp></h3>
								     <br>
                                     <div class="row d-flex justify-content-center">
										<div class="col-sm-8 ">
									       <div class="card">
										      <div class="card-block">
										         
										         <div class="form-row">
													<div class="form-group form-default form-static-label col-md-4 mb-4">
													   <span  class="font-weight-bold font-italic" style="color: #708090">Grupo</span>
													   <select style="color: #000000" name="grupoCliente" id="grupoCliente" class="form-control" onchange="getListaGrupoClientes(  ); listaGrupo( this.value )">
										                    <option value="" disabled selected>[-Selecione-]</option>
													   </select> 
													</div>
										         </div>
										      
											     <hr>  
												 <br>
										      
					                             <div class="form-row">
						                            <!-- Email do uduario de abertura -->
						                            <input type="hidden"  name="emailSolicitante" id="emailSolicitante" value="<%=session.getAttribute("emailSolicitante")%>">
						                                    
						                            <!-- URL da base da API Base TST ou PRD  -->
						                            <input type="hidden"  name="urlAPI" id="urlAPI" value="<%=session.getAttribute("urlAPI")%>">
						                            
													<div class="form-group form-default form-static-label col-md-1 mb-1">
													   <span  class="font-weight-bold font-italic" style="color: #708090" >ID</span>
													   <input style="color: #000000" type="text" name="idGrupo" id="idGrupo" readonly="readonly" class="form-control" >
													</div>

													<div class="form-group form-default form-static-label col-md-6 mb-6">
													   <span  class="font-weight-bold font-italic" style="color: #708090" >Nome Grupo</span>
													   <input style="color: #000000" type="text" name="nomeGrupo" id="nomeGrupo" class="form-control" readonly="readonly" placeholder="Nome Grupo" value="">
													</div>
																	 
													<div class="form-group form-default form-static-label col-md-2 mb-2">
													   <span  class="font-weight-bold font-italic" style="color: #708090" >Login</span>
													   <input style="color: #000000" type="text" name="login" id="login" readonly="readonly" class="form-control" value="<%=session.getAttribute("usuario")%>">
													</div>
																	
												 </div>

											     <hr>
										         <br>
										         
										         <div class="form-row">
										         
													<div class="form-group form-default form-static-label col-md-4 mb-4">
													   <span  class="font-weight-bold font-italic" style="color: #708090">Cliente Razão Social</span>
													   <select style="color: #000000" name="clienteRazaoSocial" id="clienteRazaoSocial" class="form-control" disabled onchange="getClientes( this.value )">
										                    <option value="" disabled selected>[-Selecione-]</option>
													   </select> 
													</div>
													
													<div class="form-group form-default form-static-label col-md-4 mb-4">
													   <span  class="font-weight-bold font-italic" style="color: #708090">Cliente Alias</span>
													   <select style="color: #000000" name="clienteAlias" id="clienteAlias" class="form-control" disabled onchange="getClientes( this.value )">
										                    <option value="" disabled selected>[-Selecione-]</option>
													   </select> 
													</div>
													
										         </div>
										         
										         <div class="form-row">
										         
													<div class="form-group form-default form-static-label col-md-2 mb-2">
													   <span  class="font-weight-bold font-italic" style="color: #708090" >ID</span>
													   <input style="color: #000000" type="text" name="idClienteAf" id="idClienteAf" readonly="readonly" class="form-control" >
													</div>

													<div class="form-group form-default form-static-label col-md-3 mb-3">
													   <span  class="font-weight-bold font-italic" style="color: #708090" >Cliente Razão Social</span>
													   <input style="color: #000000" type="text" name="nomeClienteAf" id="nomeClienteAf" class="form-control" readonly="readonly" placeholder="Nome Cliente"  >
													</div>
													
													<div class="form-group form-default form-static-label col-md-3 mb-3">
													   <span  class="font-weight-bold font-italic" style="color: #708090" >Cliente Alias</span>
													   <input style="color: #000000" type="text" name="nomeClienteAlias" id="nomeClienteAlias" class="form-control" readonly="readonly" placeholder="Nome Cliente">
													</div>
										         
										         </div>

											     <hr>
										         <br>

												 <div class="form-group form-default form-static-label col-md-12 mb-12">
										            <button type="button" class="btn waves-effect waves-light btn-outline-success float-right" style="border-radius: 25px;" disabled name="btAddCliente" id="btAddCliente" onclick="salvarClienteGrupo()">Add</button>
										         </div>
													
										      </div>
										   </div>
										</div>
								     </div>
                                  </div>
                               </form> 


 							   <hr>  
							   <br>
                               
                               <!-- ============================================================================================== -->
                               <!--                                                                                                -->
                               <!--                                    Lista dos Grupos cadastradps                                -->
                               <!--                                                                                                -->
                               <!-- ============================================================================================== -->
                               <div class="container d-flex justify-content-center align-items-top vw-100">
								  <div class="row d-flex justify-content-center align-items-top vw-100">
									 <div class="col-sm-12">
										<div class="card">
										   <div class="card-block">
									          <h5 class="card-title">Comunicação Pessoas</h5><hr>
											  <div style="height: 300px; overflow: scroll;">
											     <table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaGruposCliente">
												    <thead>
													   <tr class="table-primary">
												         <th scope="col" style="text-align: center; vertical-align: middle;color: white">ID          </th>
														 <th scope="col" style="vertical-align: middle;color: white"                    >Grupo       </th>
														 <th scope="col" style="vertical-align: middle;color: white"                    >Nome Cliente</th>
														 <th scope="col" style="vertical-align: middle;color: white"                    >Alias       </th>
														 <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete      </th>
													   </tr>
												    </thead>
												    
													<tbody id="tbGruposCliente">
									
													</tbody>
												 </table>
										      </div>
										   </div>
										</div>
									 </div>
							      </div>
                               </div>

                            </div>
                         </div>
                      </div>
                   </div>
                </div>
             </div>
          </div>
      </div>
  </div>

  <div id="box_dark" class="box_dark" > 
     <div class="spinner-border text-info box_modal" ></div>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
  <jsp:include page="/util/javascriptfile.jsp"></jsp:include>
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/loanding.js"></script>
  
  <script type="text/javascript">

  listaGrupoClientes( );
  listaClienteRazaoSocial( );
  listaClienteAlias( );
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function listaGrupoClientes( ){
  	
  	let urlBase = document.getElementById('urlAPI').value;
  	let urlAPI  = urlBase + 'listaGrupoCliente';
  		
  	$.ajax({
  		method : "GET",
  		url : urlAPI,
  		contentType : "application/json; charset=utf-8",
  		success : function(json) {
  		    var option = '<option value="" disabled selected>[-Selecione-]</option>';

  			for(var p = 0; p < json.length; p++){
  				option += '<option value=' + json[p].id_grupo_cliente + '>' + json[p].nome_grupo + '</option>';
  			}
  			$("#grupoCliente").html(option).show();  
  			
  		}
  	}).fail(function(xhr ) {
  		// alert("Erro ao Listar informacoes da Categoria Padrão: " + xhr.responseText);
  		MensagemConfimacao( "error", "Listar informacoes de Grupos", "Erro ao Listar informacoes de Grupos: " + xhr.responseText) ;
  	});		
  }
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function listaClienteRazaoSocial( ){
  	
  	let urlBase = document.getElementById('urlAPI').value;
  	let urlAPI  = urlBase + 'listaClientesAfetados';
  		
  	$.ajax({
  		method : "GET",
  		url : urlAPI,
  		contentType : "application/json; charset=utf-8",
  		success : function(json) {
  		    var optionRS    = '<option value="" disabled selected>[-Selecione-]</option>';

  			for(var p = 0; p < json.length; p++){
  				optionRS    += '<option value=' + json[p].id_clientes_af + '>' + json[p].nome_cliente + '</option>';
  			}
  			$("#clienteRazaoSocial").html(optionRS   ).show();  
  		}
  	}).fail(function(xhr ) {
  		// alert("Erro ao Listar informacoes da Categoria Padrão: " + xhr.responseText);
  		MensagemConfimacao( "error", "Listar informacoes de Grupos", "Erro ao Listar informacoes de Grupos: " + xhr.responseText) ;
  	});		
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function listaClienteAlias( ){
  	
  	let urlBase = document.getElementById('urlAPI').value;
  	let urlAPI  = urlBase + 'listaClientesAfetadosAlias';
  		
  	$.ajax({
  		method : "GET",
  		url : urlAPI,
  		contentType : "application/json; charset=utf-8",
  		success : function(json) {
  		    var optionAlias = '<option value="" disabled selected>[-Selecione-]</option>';

  			for(var p = 0; p < json.length; p++){
  				optionAlias += '<option value=' + json[p].id_clientes_af + '>' + json[p].alias + '</option>';
  			}
  			$("#clienteAlias").html(optionAlias).show();    			
  		}
  	}).fail(function(xhr ) {
  		// alert("Erro ao Listar informacoes da Categoria Padrão: " + xhr.responseText);
  		MensagemConfimacao( "error", "Listar informacoes de Grupos", "Erro ao Listar informacoes de Grupos: " + xhr.responseText) ;
  	});		
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function getListaGrupoClientes(){
	     $("#idGrupo"  ).val( document.getElementById( "grupoCliente" ).value  );
	     $("#nomeGrupo").val( $('#grupoCliente').find ( ":selected").text( ) );
	     document.getElementById("clienteAlias").disabled = false; 
	     document.getElementById("clienteRazaoSocial").disabled = false; 
  }
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function getClientes( id ){
// http://localhost:8090/PortalMudanca/obterClientesAfetadosPorId/82
	  	let urlBase = document.getElementById('urlAPI').value;
	  	let urlAPI  = urlBase + 'obterClientesAfetadosPorId/' + id;
	  		
	  	$.ajax({
	  		method : "GET",
	  		url : urlAPI,
	  		contentType : "application/json; charset=utf-8",
	  		success : function(json) {	  		     
	  		  $("#idClienteAf"     ).val( json.id_clientes_af );
	  		  $("#nomeClienteAf"   ).val( json.nome_cliente   );
	  		  $("#nomeClienteAlias").val( json.alias          );
	  		  document.getElementById("btAddCliente").disabled = false;
	  		}
	  	}).fail(function(xhr ) {
	  		// alert("Erro ao Listar informacoes da Categoria Padrão: " + xhr.responseText);
	  		MensagemConfimacao( "error", "Listar informacoes de Grupos", "Erro ao Listar informacoes de Grupos: " + xhr.responseText) ;
	  	});		
	  }
 
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  async function salvarClienteGrupo( ){
		try {	
			let idGrupo   = document.getElementById( 'idGrupo'  ).value;
			let idCliente = document.getElementById( 'idClienteAf').value;
			
				
//			if( nomeGrupoCli === '' ) throw 'Favor informar o nome do Grupo!';	
			
			this.showLoading();
			let urlBase = document.getElementById('urlAPI').value;
			let urlVali  = urlBase + 'isExitsClienteGrupo/' + idGrupo + '/' + idCliente;
			
            const data1 = await fetch(urlVali)
                         .then( function (response) {
	                            // If the response is successful, get the JSON
	                            if (response.ok) return response.json();
 	                            // Otherwise, throw an error
	                            throw response.status;
                       }).catch(function (error) {
	                        // There was an error
	                        throw error;
	                        //console.warn(error);
                       });
           // Valida se jah existe o cliente e caso verdadeiro, retorna a info para o usuario.
           if( data1 ) throw "Este Cliente já existe neste Grupo!";


		   let dados =[ 
			            {
					       grupoCliente: {id_grupo_cliente:idGrupo},
					       clientesAfetados: {id_clientes_af:idCliente}  
			             }
			           ];

		    let urlAPIPost  = urlBase + 'salvarListaGrupoCliente';

			const data2 = await fetch(urlAPIPost, {
			 		        	  method : 'post',
			 		        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
			 		        	  body   : JSON.stringify( dados )
			 		        	}).then(response => response.text())
			 		        	  .then(body => { return body; });
								  
			if( data2 === null )throw data1;
			else{
				Swal.fire({
					  title: "Inclusão de Cliente no Grupo!",
					  text : "Cliente inserido com sucesso no Grupo!",
					  icon : "success",
					  showCancelButton: false,
					  confirmButtonColor: "#3085d6",
					  cancelButtonColor: "#d33",
					  confirmButtonText: "OK"
					}).then((result) => {
					  if (result.isConfirmed) {
                             const obj = JSON.parse(data1);
                             
                             if( obj.status !== undefined ) throw obj.message;
                             else{
						        listaGrupo( idGrupo );
                             }
					  }
					});				 			
			 }
		 	
			hideLoading();
			   		
		} catch (error) {
		     hideLoading();
		     MensagemConfimacao( "warning", "Inclusão Grupo!",  error );
		}
		
	 }
	   

  async function listaGrupo( id ){

	  try {
		  let urlBase = document.getElementById('urlAPI').value;
		  let urlAPI  = urlBase + 'listaGrupoClientePorGrupo/' + id;
		  const listaGruposCliente = await fetch(urlAPI).then(response => response.json());
		  if( listaGruposCliente === null )throw listaGruposCliente;
		  else{
		    let tbody = document.getElementById('tbGruposCliente');
			tbody.innerText = '';
					
			for(let i = 0; i < listaGruposCliente.length; i++){
				
				let tr = tbody.insertRow();
				
			    let td_idGrupoCliente = tr.insertCell();
				let td_nomeGrupo      = tr.insertCell();
				let td_Nomeli         = tr.insertCell();
				let td_Alias          = tr.insertCell();
				let td_delete         = tr.insertCell();
				
			     // Inseri os valores do objeto nas celulas
			    td_idGrupoCliente.innerText = ( listaGruposCliente[i].grupoCliente.id_grupo_cliente !== undefined ? listaGruposCliente[i].grupoCliente.id_grupo_cliente : '' );
			    td_nomeGrupo.innerText      = ( listaGruposCliente[i].grupoCliente.nome_grupo       !== undefined ? listaGruposCliente[i].grupoCliente.nome_grupo       : '' );
			    td_Nomeli.innerText         = ( listaGruposCliente[i].clientesAfetados.nome_cliente !== undefined ? listaGruposCliente[i].clientesAfetados.nome_cliente : '' );
			    td_Alias.innerText          = ( listaGruposCliente[i].clientesAfetados.alias        !== undefined ? listaGruposCliente[i].clientesAfetados.alias        : '' );

				/////////////////////////////////////////////////////////////////
				td_idGrupoCliente.setAttribute('style', 'text-align: center; vertical-align: middle;' );

				/////////////////////////////////////////////////////////////////
				
				// Botao Delete
				let imgDelete = document.createElement('img');
				imgDelete.src = getContextPath() +'/imagens/delete-20.png';
				let funcdelete = "deleteClienteGrupos( " + listaGruposCliente[i].id_lista_grupo_cliente + ", " + listaGruposCliente[i].grupoCliente.id_grupo_cliente + ")";
				imgDelete.setAttribute('onclick', funcdelete );
				imgDelete.setAttribute('style', 'cursor:pointer;' );
				imgDelete.setAttribute('data-toggle', 'tooltip' );
				imgDelete.setAttribute('data-placement', 'top' );
				imgDelete.setAttribute('title', 'Apagar Item Categoria!!' );
				td_delete.appendChild(imgDelete);
				td_delete.classList.add('center');
			    
				
			}
		  }
		} catch (error) {
		     hideLoading();
		     MensagemConfimacao( "warning", "List Clientes de um Grupo!",  error );
		}
		
  }

  async function deleteClienteGrupos( id, idGrupo ){
	  Swal.fire({
		  title            : "Deseja realmente remover o Cliente do Grupo?",
		  text             : "Remoção de Cliente!",
//		  target           : document.getElementById( nomeModal ),
		  showDenyButton   : true,
//		  showCancelButton : true,
		  confirmButtonText: "Sim",
		  denyButtonText   : "Cancelar"
		}).then((result) => {
		  if (result.isConfirmed) {
			  deleteClienteGrupoConfirmada( id, idGrupo );
		  } else if (result.isDenied) {
		    return false;
		  }
		});	  
	  
  }
  
  async function deleteClienteGrupoConfirmada( id, idGrupo ){
		try {
		   
		   let urlBase = document.getElementById( 'urlAPI' ).value;
		   let urlAPI  = urlBase + 'deleteListaGrupoClienteById/' + id;

		   const data2 = await fetch(urlAPI, {
					        	  method : 'post',
					        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
					        	  body   : JSON.stringify({ text: 'OK'})
					        	}).then(response => response.text())
					        	  .then(body => { return body; });
								  						  
	       if( data2 === 'Cliente removido do Grugo com sucesso!' ){
			 Swal.fire({
				   title: "Remoção de Cliente do Grupo !",
				   text : data2,
				   icon : "success",
				   target: document.getElementById("modalFinalizarGMUD"),
				   showCancelButton: false,
				   confirmButtonColor: "#3085d6",
				   cancelButtonColor: "#d33",
				   confirmButtonText: "OK"
				 }).then((result) => {
				   if (result.isConfirmed) {
					   listaGrupo( idGrupo )
				   }
				 });				 
	      }else throw data2;
		  							  
	    } catch (error) {
	         hideLoading();
	         MensagemConfimacao( "warning", "Remoção de Grupo Cliente!",  error );
	    }

	 }

  function MensagemConfimacaoModal( iconi, tituloPrincipal, textoPrincipal, nomeModal ) {
	// icon
//	  	"warning"
//	  	"error"
//	  	"success"
//	  	"info"

		  Swal.fire({
			    icon  : iconi                             ,
			    title : tituloPrincipal                   ,
			    text  : textoPrincipal                    ,
			    target: document.getElementById(nomeModal),
			    }
			);	
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
  
	 /******************************************************************/
	 /*                                                                */
	 /*                                                                */
	 /******************************************************************/
	 function getContextPath() {
	    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	 }
  
  </script>
    
</body>

</html>
