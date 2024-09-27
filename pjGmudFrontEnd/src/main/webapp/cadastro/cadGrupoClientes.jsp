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
							      <div class="col-lg-10"> <h5 class="m-b-1">Portal de GMUD - Cadastro Grupo de Clientes</h5> </div>
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
                            
                               <form class="form-material d-flex justify-content-center align-items-top vw-100" action="" method="post" id="formCadGrupoClientes">
                               
                                  <div class="col-sm-8">
								     <h3 class="text-muted d-flex justify-content-center">Cadastro Grupo de Clientes<samp id="passo"></samp></h3>
								     <br>
                                     <div class="row d-flex justify-content-center">
										<div class="col-sm-8 ">
									       <div class="card">
										      <div class="card-block">
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
													   <input style="color: #000000" type="text" name="nomeGrupo" id="nomeGrupo" class="form-control" placeholder="Nome Grupo" value="">
													</div>
																	 
													<div class="form-group form-default form-static-label col-md-2 mb-2">
													   <span  class="font-weight-bold font-italic" style="color: #708090" >Login</span>
													   <input style="color: #000000" type="text" name="login" id="login" readonly="readonly" class="form-control" value="<%=session.getAttribute("usuario")%>">
													</div>
																	
												 </div>
												    
											     <hr>  
												 <br>

												 <div class="form-row">
													<div class="form-group form-default form-static-label col-md-12 mb-12">
												    <span class="font-weight-bold font-italic" style="color: #708090">observação</span>
														  <textarea style="color: #000000" class="form-control" id="obsGrupo" name="obsGrupo" placeholder="Observação" rows="100" ></textarea>
													</div>
												 </div>
													
											     <hr>
										         <br>
													
												 <div class="form-group form-default form-static-label col-md-12 mb-12">
										            <button type="button" class="btn waves-effect waves-light btn-outline-success float-right" style="border-radius: 25px;" name="btAddGrupo" id="btAddGrupo" onclick="salvarGrupoCliente( )">Salvar</button>
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
												         <th scope="col" style="vertical-align: middle;color: white"                    >ID        </th>
														 <th scope="col" style="vertical-align: middle;color: white"                    >Data      </th>
														 <th scope="col" style="vertical-align: middle;color: white"                    >Nome Grupo</th>
														 <th scope="col" style="vertical-align: middle;color: white"                    >Descrição </th>
														 <th scope="col" style="text-align: center; vertical-align: middle;color: white">Editar    </th>
														 <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete    </th>
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
  listaGrupo(  );
  async function salvarGrupoCliente( ){
		try {	
			let idGrupoCli   = document.getElementById( 'idGrupo'  ).value;
			let nomeGrupoCli = document.getElementById( 'nomeGrupo').value;
			let obsGrupoCli  = document.getElementById( 'obsGrupo' ).value;
				
			if( nomeGrupoCli === '' ) throw 'Favor informar o nome do Grupo!';	
			
			this.showLoading();
			
			let dados = {
					id_grupo_cliente: idGrupoCli  ,
					nome_grupo      : nomeGrupoCli,
					dsc_grupo       : obsGrupoCli      
			}
		
			let urlBase = document.getElementById('urlAPI').value;
		    let urlAPIPost  = urlBase + 'salvarGrupoCliente';

			 const data1 = await fetch(urlAPIPost, {
			 		        	  method : 'post',
			 		        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
			 		        	  body   : JSON.stringify( dados )
			 		        	}).then(response => response.text())
			 		        	  .then(body => { return body; });
								  
			 if( data1 === null )throw data1;
			 else{
				Swal.fire({
					  title: "Criação de Grupo!",
					  text : "Grupo( " + nomeGrupoCli +" ) inserido com sucesso!",
					  icon : "success",
					  showCancelButton: false,
					  confirmButtonColor: "#3085d6",
					  cancelButtonColor: "#d33",
					  confirmButtonText: "OK"
					}).then((result) => {
					  if (result.isConfirmed) {
//						     $( "#nomeGrupo" ).val( '' );
                             const obj = JSON.parse(data1);
                             
                             if( obj.status !== undefined ) throw obj.message;
                             else{
						        $( "#idGrupo"  ).val( obj.id_grupo_cliente );
					            listaGrupo( );
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
	   

  async function listaGrupo(  ){

	  try {
		  let urlBase = document.getElementById('urlAPI').value;
		  let urlAPI  = urlBase + 'listaGrupoCliente';
		  const listaGruposCliente = await fetch(urlAPI).then(response => response.json());
		  if( listaGruposCliente === null )throw listaGruposCliente;
		  else{
		    let tbody = document.getElementById('tbGruposCliente');
			tbody.innerText = '';
					
			for(let i = 0; i < listaGruposCliente.length; i++){
				
				let tr = tbody.insertRow();
				
			    let td_idGrupoCliente = tr.insertCell();
				let td_dtCriacao      = tr.insertCell();
				let td_nomeGrupo      = tr.insertCell();
				let td_dscGrupo       = tr.insertCell();
				let td_editar         = tr.insertCell();
				let td_delete         = tr.insertCell();
				
			     // Inseri os valores do objeto nas celulas
			    td_idGrupoCliente.innerText = ( listaGruposCliente[i].id_grupo_cliente !== undefined ? listaGruposCliente[i].id_grupo_cliente : '' );
			    td_dtCriacao.innerText      = ( listaGruposCliente[i].dt_criacao       !== undefined ? listaGruposCliente[i].dt_criacao       : '' );
			    td_nomeGrupo.innerText      = ( listaGruposCliente[i].nome_grupo       !== undefined ? listaGruposCliente[i].nome_grupo       : '' );
			    td_dscGrupo.innerText       = ( listaGruposCliente[i].dsc_grupo        !== undefined ? listaGruposCliente[i].dsc_grupo        : '' );
				/////////////////////////////////////////////////////////////////
				td_idGrupoCliente.setAttribute('style', 'vertical-align: middle' );
				/////////////////////////////////////////////////////////////////
				// Botao Editar
				let imgEdit = document.createElement('img');
				imgEdit.src = getContextPath() +'/imagens/edit-20.png';
				let funcEdit = "editGruposCliente( " + JSON.stringify( listaGruposCliente[i] ) + ")";				
				imgEdit.setAttribute('onclick', funcEdit);
				imgEdit.setAttribute('style', 'cursor:pointer;' );
				imgEdit.setAttribute('data-toggle', 'tooltip' );
				imgEdit.setAttribute('data-placement', 'top' );
				imgEdit.setAttribute('title', 'Ir para o modulo "Edição!"' );
				td_editar.appendChild(imgEdit);
				td_editar.classList.add('center');
				
				// Botao Delete
				let imgDelete = document.createElement('img');
				imgDelete.src = getContextPath() +'/imagens/delete-20.png';
				let funcdelete = "deleteGruposCliente( " + listaGruposCliente[i].id_grupo_cliente + ")";
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
		     MensagemConfimacao( "warning", "Manutenção Cat. Padrão",  error );
		}
		
  }
 
  
  async function deleteGruposCliente( id ){
	  Swal.fire({
		  title            : "Deseja realmente apagar o Grupo?",
		  text             : "Remoção de Grupo Cliente!",
//		  target           : document.getElementById( nomeModal ),
		  showDenyButton   : true,
//		  showCancelButton : true,
		  confirmButtonText: "Sim",
		  denyButtonText   : "Cancelar"
		}).then((result) => {
		  if (result.isConfirmed) {
			  deleteGruposClienteConfirmada( id );
		  } else if (result.isDenied) {
		    return false;
		  }
		});	  
	  
  }
  
  async function deleteGruposClienteConfirmada( id ){
		try {
		   
		   let urlBase = document.getElementById( 'urlAPI' ).value;
		   
		   let urlVali  = urlBase + 'deleteListaGrupoCliente/' + id;
		   const data1 = await fetch(urlVali, {
		   		        	  method : 'post',
		   		        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
		   		        	  body   : JSON.stringify({ text: 'OK'})
		   		        	}).then(response => response.text())
		   		        	  .then(body => { return body; });
		   
		   if( data1 !== 'Lista do Grupo Cliente removido com sucesso!' ) throw data1;

		   let urlAPI  = urlBase + 'deleteGrupoClientePorId/' + id;
		   const data2 = await fetch(urlAPI, {
					        	  method : 'post',
					        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
					        	  body   : JSON.stringify({ text: 'OK'})
					        	}).then(response => response.text())
					        	  .then(body => { return body; });
								  						  
	       if( data2 === 'Grupo Cliente removido com sucesso!' ){
			 Swal.fire({
				   title: "Remoção de Grupo Cliente!",
				   text : data2,
				   icon : "success",
				   target: document.getElementById("modalFinalizarGMUD"),
				   showCancelButton: false,
				   confirmButtonColor: "#3085d6",
				   cancelButtonColor: "#d33",
				   confirmButtonText: "OK"
				 }).then((result) => {
				   if (result.isConfirmed) {
					   listaGrupo(  );
				   }
				 });				 
	      }else throw data2;
		  							  
	    } catch (error) {
	         hideLoading();
	         MensagemConfimacao( "warning", "Remoção de Grupo Cliente!",  error );
	    }

	 }

  function editGruposCliente( gruposCliente ) {	

	     $("#idGrupo"  ).val( gruposCliente.id_grupo_cliente );
	     $("#nomeGrupo").val( gruposCliente.nome_grupo       );
	     $("#obsGrupo" ).val( gruposCliente.dsc_grupo        );
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
