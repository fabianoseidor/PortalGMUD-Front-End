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
       
       
      tr{cursor: pointer; transition: all .25s ease-in-out}
      .selected{background-color: red; font-weight: bold; color: #fff;}
  
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
				               <div class="col-md-10">
				                   <div class="page-header-title">
									   <div class="row">
										  <div class="col-lg-10">
										  	<h5 class="m-b-1">Portal de GMUD - Manutenção de Tarefas</h5>
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
                                    <form class="form-material" action="" method="get" id="formCadMudancaNormal">
                                          
                                         <!-- URL da base da API Base TST ou PRD  -->
                                         <input type="hidden"  name="urlAPI" id="urlAPI" value="<%=session.getAttribute("urlAPI")%>">
                                         <input type="hidden"  name="UserLogado" id="UserLogado" value="<%=session.getAttribute("usuario")%>">


									     <!-- Tabela com as informacoes do Recursos a serem cadastrasdos -->                       
										 <div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
													    <h5 class="card-header border-primary">Responsável Tarefa</h5><hr><br>
													    <div class="form-group form-default form-static-label col-md-4 mb-2">
                                                             <span  class="font-weight-bold font-italic" style="color: #708090">Responsável Tarefa</span>
                                                             <select style="color: #000000" name="selectResponsavelTarefa" id="selectResponsavelTarefa" class="form-control" onchange="selecionarTaredasResponsavel( this.value )" >
                                                                 <option value="" disabled selected>[-Selecione-]</option>
                                                             </select>
                                                        </div>
													</div>
												</div>
											</div>
										 </div>

									     <!-- Tabela com as informacoes do Recursos a serem cadastrasdos -->                       
										 <div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
													    <h5 class="card-header border-primary" id="infoTitutoTarefas">Lista de Tarefas - Quantidade de Taredas: 0${qtyTarefas}</h5><hr><br>
														<div style="height: 600px; overflow: scroll;">
														 	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaTarefas">
																  <thead>
																    <tr>
																      <th scope="col" class="center">Carregar            </th>
																      <th scope="col" class="center">Tarefa Não se Aplica</th>
																      <th scope="col" class="center">ID Mudança          </th>
																      <th scope="col"               >Mudança             </th>
																      <th scope="col" class="center">ID Tarefa           </th>
																      <th scope="col"               >Título Tarefa       </th>
																      <th scope="col"               >Data Tarefa         </th>
																      <th scope="col"               >Duração Tarefa      </th>
																      <th scope="col" class="center">Prioridade          </th>
																      <th scope="col"               >Descrição Tarefa    </th>
																      <th scope="col"               >Responsável Tarefa  </th>
																      <th scope="col"               >Data Início         </th>
																      <th scope="col"               >Data Final          </th>
																    </tr>
																  </thead>
																<tbody id="tbTarefas">
							
																</tbody>
															</table>
														</div>
							
													</div>
												</div>
											</div>
										 </div>

                                         <!-- ##################################################################################### -->
                                         <!--          Manutencao da tarefa                                                         -->
                                         <!-- ##################################################################################### -->                                                                                
                                          

                                     </form>
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
  <div id="box_dark_form" class="box_dark" > 
     <div class="spinner-border text-info box_modal" ></div>
  </div>

  <!-- ##################################################################################### -->
  <!--                            Modal Manutencao da tarefa                                 -->
  <!-- ##################################################################################### -->                                                                                
  <div class="modal t-modal primary" id=ModalManutencaoTarefa tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered modal-lg"  style="max-width: 50% !important;" role="document">
		<div class="modal-content">
			<!-- Modal Header -->
	        <div class="modal-header">
	          <h5 class="modal-title" id="TituloModalCentralizado">Reversão Distrato</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
			<!-- Modal body -->
			<div class="modal-body">
			
               <div class="row">
				  <div class="col-sm-12">
					 <div class="card">
						<div class="card-block">
                           <h5 class="card-header border-primary">Manutenção da Tarefa</h5><hr><br>
                           <input type="hidden" id="idTarefaAux" readonly="readonly">
                           <input type="hidden" id="idMudancaAux" readonly="readonly">
                           
						   <div class="form-row">
						      <div class="form-group form-default form-static-label col-md-2 mb-2">
								 <span  class="font-weight-bold font-italic" style="color: #708090" >ID Responsável Tarefa</span>
								 <input style="color: #000000" type="text" name="idResponsavelTarefa" id="idResponsavelTarefa" disabled="disabled" class="form-control" value="">
							  </div>
							  <div class="form-group form-default form-static-label col-md-4 mb-4">
							     <span  class="font-weight-bold font-italic" style="color: #708090" >Responsável Tarefa</span>
								 <input style="color: #000000" type="text" name="nomeResponsavelTarefa" id="nomeResponsavelTarefa" disabled="disabled" class="form-control" value="">
							  </div>

							  <div class="form-group form-default form-static-label col-md-4 mb-4">
							     <span  class="font-weight-bold font-italic" style="color: #708090" >E-mail</span>
								 <input style="color: #000000" type="text" name="emailResponsavelTarefa" id="emailResponsavelTarefa" disabled="disabled" class="form-control" value="">
							  </div>
							  <div class="form-group form-default form-static-label col-md-2 mb-2">
							     <span  class="font-weight-bold font-italic" style="color: #708090" >Login</span>
								 <input style="color: #000000" type="text" name="loginResponsavelTarefa" id="loginResponsavelTarefa" disabled="disabled" class="form-control" value="">
							  </div>
							  
						   </div>

                           <div class="form-row">
							  <div class="form-group form-default form-static-label col-md-8">
							     <label  class="font-weight-bold font-italic" style="color: #708090" >Título Tarefa</label>
							     <input style="color: #000000" type="text" name="tituloTarefa" id="tituloTarefa" disabled="disabled" class="form-control">
							  </div>
							  <div class="form-group form-default form-static-label col-md-2" >
							     <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Data Tarefa</label>
							     <input style="color: #000000" type="text" name="dataTarefa" id="dataTarefa" disabled="disabled" class="form-control">								     
							  </div>	
							  <div class="form-group form-default form-static-label col-md-2" >
							     <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Duração Tarefa</label>
							     <input style="color: #000000" type="time" name="duracaoTarefa" id="duracaoTarefa" disabled="disabled" class="form-control">								     
							  </div>	
                           </div>
                                           
                           <div class="from-row">
						      <div class="form-group form-default form-static-label col-md-12 mb-12">
						         <span class="font-weight-bold font-italic" style="color: #708090">Descrição Tarefa</span>
							     <textarea style="color: #000000" class="form-control" id="descricaoTarefa" disabled="disabled" name="descricaoTarefa" placeholder="Observação" rows="7" ></textarea>
						      </div>
                           </div>
                           
                           <div class="from-row">
							  <div class="form-group form-default form-static-label col-md-12 mb-12">
                                 <span class="font-weight-bold font-italic" style="color: #708090">Report Final Tarefa</span>
                                 <textarea style="color: #000000" class="form-control" id="reportFinal" disabled="disabled" name="reportFinal" placeholder="Observação" rows="7" ></textarea>
                              </div>
                           </div>
                           <hr>  
                           <br>
                           <button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" name="btFinalizar" id="btFinalizar" disabled="disabled" onclick="finalizarTarefa();">Finalizar</button>
                           <button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="margin-right: 15px;" name="btIniciar" id="btIniciar"   disabled="disabled" onclick="iniciarTarefa( );">Iniciar</button>
		                </div>
				     </div>
		          </div>
		       </div>

			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-success" style="border-radius: 25px;" data-dismiss="modal">Fechar</button>
			</div>
		
		</div>
	</div>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>    
  <jsp:include page="/util/javascriptfile.jsp"></jsp:include>
   
  <script type="text/javascript">
  
  listaResponsavelAtividade( 0 );
  
  async function selecionarTaredasResponsavel( idResponsavel ) {
     try {
    	    showLoading();
    	    let urlBase = document.getElementById('urlAPI').value;
            //let urlAPI  = urlBase + 'listaAtitividadesEmAberto/' + idResponsavel;
            let urlAPI  = urlBase + 'listaAtitividadesEmAbertoDTO/' + idResponsavel;
            const listaTarefaResponsvel = await fetch(urlAPI).then(response => response.json());
            
            if( listaTarefaResponsvel.length > 0 )listaTabelaTarefa( listaTarefaResponsvel );
			else{
               MensagemConfimacao( "info", "Lista tarefas Responsável", "Não foi encontrado Tarefas para este Responsável!" ); 
               document.getElementById("infoTitutoTarefas").textContent = "Lista de Tarefas - Quantidade de Taredas: 0";
			}   
//            console.log( listaTarefaResponsvel );
            hideLoading();
//            return listaTarefaResponsvel;            
     } catch (error) {
         hideLoading();
         MensagemConfimacaoModal( "error", "Tarefas", "Erro ao Inicialização de Tarefas: " + xhr.responseText, "modalExecucaoTarefaGMUD" ) ;
     }	
}
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
   function listaResponsavelAtividade(idResponsavelAtividade){
  	 let urlBase = document.getElementById('urlAPI').value;
  	 let urlAPI  = urlBase + 'listaResponsavelAtividade';
  		
  	$.ajax({
  		method : "GET",
//  		url : "http://localhost:8090/PortalMudanca/listaResponsavelAtividade",
  		url : urlAPI,
  		contentType : "application/json; charset=utf-8",
  		success : function(json) {
  		    var option = '<option value="" disabled selected>[-Selecione-]</option>';

  			for(var p = 0; p < json.length; p++){
  				if( json[p].id_responsavel_atividade === idResponsavelAtividade  )
  			  	     selected = 'selected';
  				 else selected = '';
  				
  				option += '<option value=' + json[p].id_responsavel_atividade + ' ' + selected + '>' + json[p].responsavel_atividade + '</option>';
  			}
  			$("#selectResponsavelTarefa").html(option).show();  
  			
  		}
  	}).fail(function(xhr ) {
  		// alert("Erro ao Listar Plano de comunicação: " + xhr.responseText);
  		MensagemConfimacao( "error", "Responsável Tarefa", "Erro ao listar Responsável Tarefa: " + xhr.responseText );
  	});		
  }
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function getTarefa( idTarefa ) {
	    
		let urlBase = document.getElementById('urlAPI').value;
	    let urlAPI  = urlBase + 'obterPorIdAtividadeMudanca/';
	  
		$.ajax({
			method     : "GET"                             ,
//			url        : "http://localhost:8090/PortalMudanca/obterPorIdAtividadeMudanca/"+ idTarefa                            ,
			url        : urlAPI + idTarefa                 ,
			contentType: "application/json; charset=utf-8" ,
			beforeSend: function( xhr ) {
				   showLoading();
				},
			success    : function(response) {
				// console.log( "length: " + response.length );
				
				if( response.error !== undefined ){
				    MensagemConfimacao( "warning", "Pesquisa GMUD", response.error );
			    }else{
			    	$('#idTarefaAux'           ).val( response.id_atividade_mudanca                            );
			    	$('#idMudancaAux'          ).val( response.mudanca.id_mudanca                              );
			    	$('#idResponsavelTarefa'   ).val( response.responsavelAtividade.id_responsavel_atividade   );
			    	$('#nomeResponsavelTarefa' ).val( response.responsavelAtividade.responsavel_atividade      );
			    	$('#emailResponsavelTarefa').val( response.responsavelAtividade.email_responsavel_atividade);
			    	$('#tituloTarefa'          ).val( response.titulo_atividade_mudanca                        );
			    	$('#dataTarefa'            ).val( formatData( 1,response.dt_tarefa)                        );
			    	$('#duracaoTarefa'         ).val( response.duracao                                         );
			    	$('#descricaoTarefa'       ).val( response.atividade_mudanca                               );
			    	$('#reportFinal'           ).val( response.report_final                                    );
			    	$('#loginResponsavelTarefa').val( response.responsavelAtividade.login_responsavel_atividade);
			    	

		    		$('#btFinalizar'    ).attr('disabled'      , true    );
		    		$('#reportFinal'    ).attr('disabled'      , true    );
		    		$('#btIniciar'      ).attr('disabled'      , true    );
		    		$('#btIniciar'      ).attr("data-toggle"   ,"tooltip");
		    		$('#btIniciar'      ).attr("data-placement","top"    );
		    		$('#btFinalizar'    ).attr("data-toggle"   ,"tooltip");
		    		$('#btFinalizar'    ).attr("data-placement","top"    );
		    		
		    		$('#btFinalizar'    ).attr("title","É necessário iniciar a tarefa antes de fecha-la!");

		            /// Valida botoes de inico e fim de tarefa
		            if(  response.dt_inicio_tarefa === null && response.dt_final_tarefa === null )
		            	validaBotoesTarefa( false, true, response.responsavelAtividade.login_responsavel_atividade );
		            else 
		              if( response.dt_inicio_tarefa !== null && response.dt_final_tarefa === null )
		            	  validaBotoesTarefa( true, false, response.responsavelAtividade.login_responsavel_atividade );
		              else 
		            	if( response.dt_inicio_tarefa !== null && response.dt_final_tarefa !== null )
		            		 validaBotoesTarefa( true, true, response.responsavelAtividade.login_responsavel_atividade );
			    }
				hideLoading();
				$('#ModalManutencaoTarefa').modal('toggle');
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao Listar Mudanças: " + xhr.responseText);
			hideLoading();
			MensagemConfimacao( "error", "Tarefas", "Erro ao Listar Mudanças: " + xhr.responseText ) ;
		});		
 
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
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  async function getResponsavelTarefa(){
      let urlBase = document.getElementById('urlAPI').value;
      let urlAPI  = urlBase + 'listaResponsavelAtividade';
      const l_ResponsavelCliente = await fetch(urlAPI).then(response => response.json());
      return l_ResponsavelCliente;
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  async function getTipoMudanca( idTarefa ){

      let urlBase = document.getElementById('urlAPI').value;
      let urlAPI  = urlBase + 'getIdTipoMudanca/' + idTarefa;
      const id = await fetch(urlAPI).then(response => response.json());
      return id;
      
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  async function funcUpdateResponsavelAtivade( idSelect, idAtividadeMudanca, loginUser ){
	 let idResponsavel  = document.getElementById(idSelect).value;
	 let nomeResponsavel = $('#'+idSelect).find ( ":selected").text( )              ;

     let urlBase = document.getElementById('urlAPI').value;
     let urlAPI  = urlBase + 'mudarResponsavelAtividade/' + idAtividadeMudanca + '/' + idResponsavel + '/' + nomeResponsavel + '/' + loginUser;

	 const r_updadeRespons = await fetch( urlAPI, { method : 'POST',
                                                     headers: { 'Content-Type': 'application/json; charset=utf-8' }
				                                   }).then(response => response.text())
				                                   .then(body => { return body; });
	 let msg = "";
     if( r_updadeRespons === 'sucesso' ){
         msg = "Update Responsável Atividade para " + nomeResponsavel + ", realizado com Sucesso!";
         MensagemConfimacao("success","Update Responsável Atividade", msg);
     }else {
        msg = "ERRO: Update Responsável Atividade para " + nomeResponsavel + "!";
        MensagemConfimacao("error","Update Responsável Atividade", msg);
     }     
  }

  async function ignorarTarefa( id ) {
	  const {
	    value: numberinput,
	    isConfirmed,
	    isDismissed
	  } = await Swal.fire({
		    title             : 'Deseja realmente Ignorar esta Tarefa "' + id + '"?'          ,
		    text              : 'Ao clicar no botão "Ignorar Tarefa!", a tarefa será ignorada.',
		    icon              : 'warning',
		    confirmButtonColor: '#3bc42b',
		    confirmButtonText : 'Ignorar Tarefa!',
		    reverseButtons    : true,
		    cancelButtonColor : '#d33',
		    cancelButtonText  : 'Cancelar',
		    showCancelButton  : true,
	  })

	  if (isConfirmed) {
	      const report        = "Tarefa cancelada-ignorada manualmente!";
	      const userIgnorar   = "Usuário responsável por ignorar tarefa - " + document.getElementById('UserLogado').value;
	      const idResponsavel = document.getElementById('selectResponsavelTarefa').value;
		  let urlBase         = document.getElementById('urlAPI').value;
		  let urlAPI          = urlBase + 'ignorarTarefa/' + id + '/' + report + '/' + userIgnorar;
		  const resposta      = await fetch( urlAPI, { method : 'POST',
			   	                                       headers: { 'Content-Type': 'application/json; charset=utf-8' }
			   	                                     }).then(response => response.text())
			   	                                       .then(body => { return body; });
		  let msg = "";
		  if( resposta === 'sucesso' ){
			  msg = "Tarefa " + id + ", atualizada com Sucesso!";
			  MensagemConfimacao("success","Atualizar Tarefas", msg );
			  selecionarTaredasResponsavel( idResponsavel );
		  }else {
			msg = "ERRO: Ao Atualizar Tarefa " + id + "! - " + resposta;
			MensagemConfimacao("error","Atualizar Tarefas", msg );
		  }	
	  } else
          if (isDismissed) {
	          return false;
	      }
	  
	  hideLoading();
	}  

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  async function listaTabelaTarefa( tarefas ){
		let tbody = document.getElementById('tbTarefas');
		tbody.innerText = '';
/*		
		let l_r_Cliente = await getResponsavelTarefa();
		let userLogado = document.getElementById('UserLogado').value;
*/		
		document.getElementById("infoTitutoTarefas").textContent = "Lista de Tarefas - Quantidade de Taredas: " + tarefas.length;
		
		for(let i = 0; i < tarefas.length; i++){

			let tr = tbody.insertRow();
/*
	        var idSelect = "id_select_"+i;
	        let valorSelect = "";
	                
	        if( tarefas[i].dt_inicio_tarefa !== null || userLogado !== tarefas[i].login_user ){
                const nomeResp   = tarefas[i].responsavel_atividade;
                const idNomeResp = tarefas[i].id_responsavel_atividade; 
                let   msn        = "";
                if( userLogado !== tarefas[i].login_user )
                	msn = 'Somente o Owner da GMUD poderá alterar o executor da tarefa!';
                else msn = 'Não é possível alterar o responsável desta tarefa, pois já foi iniciada pelo usuário "' + nomeResp + '"!';
	        	
	        	valorSelect = " <select data-toggle=\"tooltip\" data-placement=\"top\" title=\"" + msn + "\" style=\"text-align: center; vertical-align: middle\" class=\"form-control\" id=\"" + idSelect + "\" >";
	        	valorSelect += "<option value=" + idNomeResp + " selected disabled>" + nomeResp + "</option>"; 
	        	valorSelect += " </select>";
	        }else{
	            valorSelect = " <select style=\"text-align: center; vertical-align: middle\" class=\"form-control\" id=\"" + idSelect + "\" onchange=\"funcUpdateResponsavelAtivade('" + idSelect + "', "  + tarefas[i].id_atividade_mudanca + ", '" + loginUser + "' )\">";
	            for(let j = 0; j < l_r_Cliente.length; j++){
                    if( tarefas[i].id_responsavel_atividade === l_r_Cliente[j].id_responsavel_atividade ) selected = " selected ";
                    else selected = "";	
	                valorSelect += "<option value=" + l_r_Cliente[j].id_responsavel_atividade + " " + selected + ">" + l_r_Cliente[j].responsavel_atividade + "</option>"; 
	            }
	            valorSelect += " </select>";	
	        }			
*/			
	        let td_carregar                  = tr.insertCell();
	        let td_ignorar                   = tr.insertCell();
	        let td_idMudanca                 = tr.insertCell();
	        let td_tutuloMudanca             = tr.insertCell();
	        let td_idTarefaShow              = tr.insertCell();
	        let td_tituloTarefaShow          = tr.insertCell();
	        let td_dataTarefaShow            = tr.insertCell();
	        let td_duracaoTarefaShow         = tr.insertCell();
	        let td_prioridadefa              = tr.insertCell();
	        let td_descricaoTarefaShow       = tr.insertCell();
	        let td_nomeResponsavelTarefaShow = tr.insertCell();
	        let td_dataInicioTarefaShow      = tr.insertCell();
	        let td_dataFimTarefaShow         = tr.insertCell();
	        
	        let duracaoFort = ' - ';
	        if( tarefas[i].duracao !== undefined )
	            duracaoFort = formatDuracao( tarefas[i].duracao );
	        
	        let dtInicioTarefa = ' - ';
	        let dtFinalTarefa  = ' - '; 
	        if( tarefas[i].dt_inicio_tarefa !== null  )
	        	dtInicioTarefa = formatDataStr( tarefas[i].dt_inicio_tarefa );
	        if( tarefas[i].dt_final_tarefa !== null  )
	        	dtFinalTarefa = formatDataStr( tarefas[i].dt_final_tarefa );
	        	        
            // Inseri os valores do objeto nas celulas
            
            td_idMudanca.innerText                 = ( tarefas[i].id_mudanca               !== undefined ? tarefas[i].id_mudanca                 : ' - '          );
            td_tutuloMudanca.innerText             = ( tarefas[i].titulo_mudanca           !== undefined ? tarefas[i].titulo_mudanca             : ' - '          );
            td_tituloTarefaShow.innerText          = ( tarefas[i].titulo_atividade_mudanca !== undefined ? tarefas[i].titulo_atividade_mudanca   : ' - '          );
            td_idTarefaShow.innerText              = ( tarefas[i].id_atividade_mudanca     !== undefined ? tarefas[i].id_atividade_mudanca       : ' - '          );
            td_dataTarefaShow.innerText            = ( tarefas[i].dt_tarefa                !== undefined ? formatData( 1, tarefas[i].dt_tarefa ) : ' - '          );
            td_duracaoTarefaShow.innerText         = ( duracaoFort                         === ' - '     ? duracaoFort                           : duracaoFort    );
            td_prioridadefa.innerText              = ( tarefas[i].prioridade               !== undefined ? tarefas[i].prioridade                 : ' - '          );
            td_descricaoTarefaShow.innerText       = ( tarefas[i].atividade_mudanca        !== undefined ? tarefas[i].atividade_mudanca          : ' - '          );
    		td_nomeResponsavelTarefaShow.innerText = ( tarefas[i].responsavel_atividade    !== undefined ? tarefas[i].responsavel_atividade      : ''             );
            td_dataInicioTarefaShow.innerText      = ( dtInicioTarefa                      !== ' - '     ? formatData( 2, dtInicioTarefa )       : dtInicioTarefa );
            td_dataFimTarefaShow.innerText         = ( dtFinalTarefa                       !== ' - '     ? formatData( 2, dtFinalTarefa   )      : dtFinalTarefa  );
            
//            td_nomeResponsavelTarefaShow.outerHTML = valorSelect; // Selecte de Responsavel pela Tarefa, caso seja necess'ario alterar.

            /////////////////////////////////////////////////////////////////////////////////////////////////////////
            let imgcarregar = document.createElement('img');
            imgcarregar.src = getContextPath() +'/imagens/mostrar-propriedade.-48.png';
            imgcarregar.setAttribute( 'cursor', 'pointer' );
            imgcarregar.setAttribute('onclick','getTarefa( ' +  tarefas[i].id_atividade_mudanca + ' )');
            td_carregar.appendChild(imgcarregar);
            td_carregar.classList.add('center');
            
            /////////////////////////////////////////////////////////////////////////////////////////////////////////
             
            let imgIgnorar = document.createElement('img');
            imgIgnorar.setAttribute('data-toggle'   , 'tooltip' );
            imgIgnorar.setAttribute('data-placement', 'top'     );
            	
           	if( tarefas[i].id_tipo_mudanca === 3 ){

           		if( userLogado === tarefas[i].login_user ){
	           	    imgIgnorar.src = getContextPath() +'/imagens/ignorar-48.png';
	           	    imgIgnorar.setAttribute('onclick','ignorarTarefa( ' +  tarefas[i].id_atividade_mudanca + ' )');
	           	    imgIgnorar.setAttribute( 'cursor', 'pointer' );
	           	    imgIgnorar.setAttribute('title', 'Click aqui para ignorar esta tarefa!' );
	           	    td_ignorar.appendChild( imgIgnorar );
	           	    td_ignorar.classList.add('center');
           		}else{
                   	imgIgnorar.src = getContextPath() +'/imagens/ignorar-N-48.png';
                   	imgIgnorar.setAttribute( 'cursor', 'pointer' );
                   	td_ignorar.appendChild( imgIgnorar );
                   	td_ignorar.classList.add('center'); 
                   	imgIgnorar.setAttribute('title' , 'Esta tarefa só poderá ser Atualuzada Pelo Owner da GMUD!' );
                }
           	    
           	 
           	}else{
               	imgIgnorar.src = getContextPath() +'/imagens/ignorar-N-48.png';
               	imgIgnorar.setAttribute( 'cursor', 'pointer' );
               	td_ignorar.appendChild( imgIgnorar );
               	td_ignorar.classList.add('center'); 
               	imgIgnorar.setAttribute('title' , 'Esta tarefa não pode ser ignorada!' );
            }            	

            imgcarregar.setAttribute('data-toggle'   , 'tooltip'            );
            imgcarregar.setAttribute('data-placement', 'top'                );
            imgcarregar.setAttribute('title'         , 'Visualizar Tarefa!' );              
            
            if( tarefas[i].dt_inicio_tarefa === null ) td_dataInicioTarefaShow.classList.add('center');
            if( tarefas[i].dt_final_tarefa  === null ) td_dataFimTarefaShow.classList.add('center');
            
            td_carregar.setAttribute                 ('style', 'vertical-align: middle' );
            td_tituloTarefaShow.setAttribute         ('style', 'vertical-align: middle' );
            td_dataTarefaShow.setAttribute           ('style', 'vertical-align: middle' );
            td_duracaoTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
            td_prioridadefa.setAttribute             ('style', 'vertical-align: middle; text-align:center' );
            td_descricaoTarefaShow.setAttribute      ('style', 'vertical-align: middle' );
            td_nomeResponsavelTarefaShow.setAttribute('style', 'vertical-align: middle' );
            td_dataInicioTarefaShow.setAttribute     ('style', 'vertical-align: middle' );
            td_dataFimTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
            td_idMudanca.setAttribute                ('style', 'vertical-align: middle; text-align:center' );
            td_tutuloMudanca.setAttribute            ('style', 'vertical-align: middle' );
            td_carregar.setAttribute                 ('style', 'vertical-align: middle; text-align:center' );
            td_idTarefaShow.setAttribute             ('style', 'vertical-align: middle; text-align:center' );
        }
   }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/ 
  async function checkPrioridadeTarefa( idMudanca, idTarefa ) {
	try {
		let urlBase       = document.getElementById('urlAPI').value;
		let urlAPI  = urlBase + 'checkPrioridadeTarefas/' + idMudanca + '/' +idTarefa ;	
		const checkReturn = await fetch(urlAPI).then(response => response.json());
		
		return checkReturn;
	} catch (error) {
		 hideLoading();
		 MensagemConfimacaoModal( "error", "Tarefas", "Erro ao Inicialização de Tarefas: " + xhr.responseText, "modalExecucaoTarefaGMUD" ) ;
	}
  }

  async function validaBotoesTarefa( checkInicia, checkFinaliza, loginResponsavelAtividade ) {
	  
	  let userLogado = document.getElementById('UserLogado').value;
	  
	  $( '#btIniciar'  ).attr('disabled', checkInicia  );
	  $( '#reportFinal').attr('disabled', checkFinaliza);
	  $( '#btFinalizar').attr('disabled', checkFinaliza);

	  if( userLogado !== loginResponsavelAtividade ){
  		$('#btFinalizar'    ).attr('disabled', true);
  		$('#reportFinal'    ).attr('disabled', true);
  		$('#btIniciar'      ).attr('disabled', true);
  		
  		$('#btIniciar'      ).attr("title","Esta tarefa só poderá ser iniciada pelo Responsável por ela!");			    		
  		$('#btFinalizar'    ).attr("title","Esta tarefa só poderá ser finalizada pelo Responsável por ela!");
      }else{
  		$('#btIniciar').attr("title","Iniciar tarefa!");
  		if( !checkFinaliza ) $('#btFinalizar').attr("title","Finalizar tarefa!");
      }
  }

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  async function iniciarTarefa( loginResponsavelAtividade ) {
	try {
		 showLoading();
		 let idTarafaInici   = document.getElementById( 'idTarefaAux'             ).value;
		 let loginRes        = document.getElementById( 'loginResponsavelTarefa'  ).value; 
		 let idMudInici      = document.getElementById( 'idMudancaAux'            ).value;
		 const idResponsavel = document.getElementById( 'selectResponsavelTarefa' ).value;
		 const checkReturn   = await checkPrioridadeTarefa( idMudInici, idTarafaInici )
		 if( !checkReturn ) throw 'Existe tarefas com "Prioridade" menor, que não foram finalizadas. Favor executá-las primeiro que esta!';
		
		 let urlBase          = document.getElementById('urlAPI').value;
		 let urlAPI           = urlBase + 'inicializaTarefa/';
		 const r_IniciarTarefa = await fetch(urlAPI + idTarafaInici, {
		   	                                               method : 'POST',
		   	                                               headers: { 'Content-Type': 'application/json; charset=utf-8' }
		   	                          }).then(response => response.text())
		   	                            .then(body => { return body; });
		 let msg = "";
		 if( r_IniciarTarefa === 'sucesso' ){
		     msg = "Tarefa " + idTarafaInici + ", Inicializada com Sucesso!";
			 MensagemConfimacaoModal("success","Inicializacao de Tarefas", msg, "ModalManutencaoTarefa");
			 selecionarTaredasResponsavel( idResponsavel );
			 await validaBotoesTarefa( true, false, loginRes );
		 }else {
			msg = "ERRO: Ao Inicializada Tarefa " + id + "!";
			MensagemConfimacaoModal("error","Inicializacao de Tarefas", msg, "ModalManutencaoTarefa");
		 }
		 
		 hideLoading();
		 
	} catch (error) {
		 hideLoading();
		 MensagemConfimacaoModal( "error", "Tarefas",  error, "ModalManutencaoTarefa" );
	 }
  }
  
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function finalizarTarefa( loginResponsavelAtividade ){

		let idTarafaInici   = document.getElementById( 'idTarefaAux'            ).value; 
		let loginRes        = document.getElementById( 'loginResponsavelTarefa' ).value; 
		const idResponsavel = document.getElementById( 'selectResponsavelTarefa').value;
		let reportFinalF    = document.getElementById( 'reportFinal'            ).value; 
		
		if( reportFinalF.trim() == ''){ 
			MensagemConfimacaoModal("warning","Finalizar Tarefa", "Favor preencher o Report Final!", "ModalManutencaoTarefa");
			return false;
		}

		let urlBase = document.getElementById('urlAPI').value;
//	    let urlAPI  = urlBase + 'finalizaTarefa/';
		let urlAPI  = urlBase + 'finalizaTarefaBody';

		let dados = {
				idAtividadeMudanca : idTarafaInici,
				reportFinal        : reportFinalF                             
		};  

		$.ajax({
			method : "POST",
//			url : urlAPI + idTarafaInici + "/" + reportFinalF,
            url         : urlAPI                           ,
			contentType : "application/json; charset=utf-8",
			data        : JSON.stringify(dados)            ,
			beforeSend: function( xhr ) {
				   showLoading();
				},
			success : function(response) {
				hideLoading();
//				console.log("response: " + response);
				
				let msg = "";
				if( response === 'sucesso' ){
					msg = "Tarefa " + idTarafaInici + ", Finalizar com Sucesso!";
				    MensagemConfimacaoModal("success","Finalizar Tarefa", msg, "ModalManutencaoTarefa");
				    selecionarTaredasResponsavel( idResponsavel );
				    validaBotoesTarefa( true, true, loginRes );

				}else 
					if( response === 'TAREFA_NAO_INICIADA' ){
						msg = "A Tarefa " + idTarafaInici + " não Inicializada! Ela só podera ser finalizada, após ser iniciada e executada!";
						MensagemConfimacaoModal("error","Finalizar Tarefa", msg, "ModalManutencaoTarefa");
				}
				else{
					msg = "ERRO: Ao Finalizar Tarefa " + idTarafaInici + "!";
					MensagemConfimacaoModal("error","Finalizar Tarefa", msg, "ModalManutencaoTarefa");
	            }
				
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao Inicialização de Tarefas: " + xhr.responseText);
			hideLoading();
//			MensagemConfimacao( "error", "Tarefas", "Erro ao Finalizar de Tarefas: " + xhr.responseText) ;
			if (xhr.status == 500){
	            var answer = xhr.responseText; //adiciona o que foi carregado a uma variável
	            var patients = JSON.parse(answer); //converte o que foi carregado para um objeto javascript
//		        alert(  patients.status + ' - '+ patients.message + ' - '+ patients.path + ' - '+ patients.error )
				let msnErro = 'Erro ao Finalizar de Tarefas: ' + patients.status + ' / Mensagem erro: ' + patients.message;
				Swal.fire({
							icon  : "error"        ,
							title : patients.error ,
							text  : msnErro        ,
							target: document.getElementById("ModalManutencaoTarefa"),
						  });
			}else{
				Swal.fire({
				    icon  : "error"                             ,
				    title : "Salvar GMUD"                       ,
				    text  : "Erro ao salvar GMUD: " + xhr.responseText ,
				    target: document.getElementById("ModalManutencaoTarefa"),
				    }
				);
			}
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
  function AlerataMensagensModal( tituloPrincipal, textoPrincipal,  nomeModal ) {
      Swal.fire({
			  title            : tituloPrincipal,
			  text             : textoPrincipal,
			  target           : document.getElementById( nomeModal ),
			  showDenyButton   : true,
//  			  showCancelButton : true,
			  confirmButtonText: "Sim",
			  denyButtonText   : "Cancelar"
			}).then((result) => {
			  if (result.isConfirmed) {
			     return true;
			  } else if (result.isDenied) {
			    return false;
			  }
			});	  
  }
    
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function AlerataMsnModal( iconi, tituloPrincipal, textoPrincipal,  nomeModal ) {
      Swal.fire({
    	      icon             : iconi                             ,
			  title            : tituloPrincipal,
			  text             : textoPrincipal,
			  target           : document.getElementById( nomeModal ),
			  showDenyButton   : false,
  			  showCancelButton : false,
			  confirmButtonText: "OK"
			}).then((result) => {
				if (result.isConfirmed) {
					return true;
				  } 
				
			});	  
  }
  
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
 
  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
 function showLoading(){
	$("#box_dark").css('display','flex');
	$("#box_dark_form").css('display','flex');
 }

 /******************************************************************/
 /*                                                                */
 /*                                                                */
 /******************************************************************/
 function hideLoading(){
	$("#box_dark").css('display','none');
	$("#box_dark_form").css('display','none');
 }
 
 
</script>
    
</body>

</html>
