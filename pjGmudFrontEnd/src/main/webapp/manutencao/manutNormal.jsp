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
										  	<h5 class="m-b-1">Portal de GMUD - Cadastro de Mudança Normal</h5>
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
                                               
                                          <div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-block">
													    <h5 class="card-header border-primary">Dados de Impacto da Mudança</h5><hr><br>
													    
			                                            <div class="form-row">
															<div class="form-group form-default form-static-label col-md-2 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >ID Mudança</span>
															     <input style="color: #000000" type="text" name="idMudancaParametro" id="idMudancaParametro" class="form-control" disabled="disabled" value="${param.idMudanca}">
															</div>
															<div class="form-group form-default form-static-label col-md-4 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >Título da Mudança</span>
															     <input style="color: #000000" type="text" name="tituloMudanca" id="tituloMudanca" class="form-control" disabled="disabled">
															</div>
															 
															<div class="form-group form-default form-static-label col-md-2 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >Login</span>
															     <input style="color: #000000" type="text" name="login" id="login" disabled="disabled" class="form-control" value="Login Teste">
															</div>
															<div class="form-group form-default form-static-label col-md-2 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >Status</span>
															     <input style="color: #000000" type="text" name="idStatus" id="idStatus" class="form-control" disabled="disabled">
															</div>
															
															<div class="form-group form-default form-static-label col-md-2 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >Tipo de Mudança</span>
															     <input style="color: #000000" type="text" name="tipoMudanca" id="tipoMudanca" disabled="disabled" class="form-control" value="Emergencia">
															</div>
															  
													    </div>
														<hr>  
														<br>
														<div class="form-row">
															<div class="form-group form-default form-static-label col-md-6 mb-4">
																<span  class="font-weight-bold font-italic" style="color: #708090">Impacto da Mudança</span>
																<input style="color: #000000" type="text" name="urgenciaMudanca" id="impactoMudanca" class="form-control" disabled="disabled">
															</div>
		
															<div class="form-group form-default form-static-label col-md-6 mb-4">
																<span  class="font-weight-bold font-italic" style="color: #708090">Urgência da Mudança</span>
																<input style="color: #000000" type="text" name="urgenciaMudanca" id="urgenciaMudanca" class="form-control" disabled="disabled">
															</div>
														</div>	
														<hr>  
														<br>
														<div class="form-row">
															<div class="form-group form-default form-static-label col-md-3 mb-6" >
															    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Data de Execução</label>
															    <input style="color: #000000" type="text" name="dataExecucao" id="dataExecucao" class="form-control" disabled="disabled">								     
															</div>	
															
															<div class="form-group form-default form-static-label col-md-3 mb-6" >
															    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Horario de Inicio</label>
															    <input style="color: #000000" type="time" name="horarioInicio" id="horarioInicio" disabled="disabled" class="form-control">								     
															</div>	
		
															<div class="form-group form-default form-static-label col-md-3 mb-6" >
															    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Data prevista de conclusão</label>
															    <input style="color: #000000" type="text" name="dataPrevistaConclusao" id="dataPrevistaConclusao" disabled="disabled" class="form-control">								     
															</div>	
															
															<div class="form-group form-default form-static-label col-md-3 mb-6" >
															    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Horario previsto para conclusão</label>
															    <input style="color: #000000" type="time" name="HorarioPrevistoConclusao" id="HorarioPrevistoConclusao" disabled="disabled" class="form-control">								     
															</div>	
		
														</div>
														
														<hr>  
														<br>
														<div class="form-row">
															<div class="form-group form-default form-static-label col-md-12 mb-12">
															     <span class="font-weight-bold font-italic" style="color: #708090">Descrição da mudança</span>
															     <textarea style="color: #000000" class="form-control step_1_validar" id="descricaoMudanca" name="descricaoMudanca" disabled="disabled" rows="100" ></textarea>
															</div>
														</div>
														
														<hr>  
														<br>
														
														<div class="form-row">
															<div class="form-group form-default form-static-label col-md-12 mb-12">
															     <span class="font-weight-bold font-italic" style="color: #708090">Justificativa da mudança</span>
															     <textarea style="color: #000000" class="form-control step_1_validar" id="justificativaMudanca" name="justificativaMudanca" disabled="disabled" rows="100" ></textarea>
															</div>
														</div>
										
										            </div>
										        </div>
										    </div>
										 </div>
                                          
                                         <!-- ##################################################################################### -->
                                         <!--          Etapa Plano de execução da Mudança                                           -->
                                         <!-- ##################################################################################### -->                                                                                
                                          
                                         <div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-block">
                                                        <h5 class="card-header border-primary">Lista de Tarefa</h5><hr><br>
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
		
															<div class="form-group form-default form-static-label col-md-6 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >E-mail</span>
															     <input style="color: #000000" type="text" name="emailResponsavelTarefa" id="emailResponsavelTarefa" disabled="disabled" class="form-control" value="">
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
															     <textarea style="color: #000000" class="form-control" id="descricaoTarefa" disabled="disabled" name="descricaoTarefa" placeholder="Observação" rows="100" ></textarea>
															</div>
		                                                </div>

		                                                <div class="from-row">
															<div class="form-group form-default form-static-label col-md-12 mb-12">
															     <span class="font-weight-bold font-italic" style="color: #708090">Report Final Tarefa</span>
															     <textarea style="color: #000000" class="form-control" id="reportFinal" disabled="disabled" name="reportFinal" placeholder="Observação" rows="100" ></textarea>
															</div>
		                                                </div>
		                                                
														<hr>  
														<br>
														<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" name="btFinalizar" id="btFinalizar" disabled="disabled" onclick="finalizarTarefa();">Finalizar</button>
														<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="margin-right: 15px;" name="btIniciar" id="btIniciar"   disabled="disabled" onclick="iniciarTarefa( );">Iniciar</button>
														<a href="javascript:abrirModalTransfTarefa( urlAPI.value, idMudancaParametro.value, login.value )" class="float-right mytooltip tooltip-effect-9 text-success" style="margin-right: 15px;" >
                                                           <img border="10" src="<%= request.getContextPath() %>/imagens/compartilhar-48.png" width="38" height="38" >
                                                           <span class="tooltip-content3">Transferência de responsabilidade da Tarefa.</span>
                                                        </a>
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
														<div style="height: 300px; overflow: scroll;">
														 	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaTarefas">
																  <thead>
																    <tr>
																      <th scope="col" class="center">Carregar          </th>
																      <th scope="col"               >Título Tarefa     </th>
																      <th scope="col"               >Data Tarefa       </th>
																      <th scope="col"               >Duração Tarefa    </th>
																      <th scope="col" class="center">Prioridade        </th>
																      <th scope="col"               >Descrição Tarefa  </th>
																      <th scope="col"               >Responsável Tarefa</th>
																      <th scope="col"               >Data Início       </th>
																      <th scope="col"               >Data Final        </th>
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
										
                                         <div class="row">
										    <div class="col-sm-12">
											   <div class="card">
												  <div class="card-block">
												    <h5 class="card-header border-primary">Report de Conclusão da Mudança.</h5><hr><br>
	                                                <div class="from-row">
														<div class="form-group form-default form-static-label col-md-12 mb-12">
														     <span class="font-weight-bold font-italic" style="color: #708090">Report final</span>
														     <textarea style="color: #000000" class="form-control" id="reportFinal" name="reportFinal" disabled="disabled" rows="100" ></textarea>
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
													    <h5 class="card-header border-primary">Ações pós Atividades</h5><hr><br>
		                                                <div class="from-row">
															<div class="form-group form-default form-static-label col-md-12 mb-12">
															     <span class="font-weight-bold font-italic" style="color: #708090">Plano de Testes</span>
															     <textarea style="color: #000000" class="form-control" id="planoTestes" name="planoTestes" disabled="disabled" rows="100" ></textarea>
															</div>
		                                                </div>
														<hr>  
														<br>
		                                                <div class="from-row">
															<div class="form-group form-default form-static-label col-md-12 mb-12">
															     <span class="font-weight-bold font-italic" style="color: #708090">Plano de Retorno</span>
															     <textarea style="color: #000000" class="form-control" id="planoRetorno" name="planoRetorno" disabled="disabled" rows="100" ></textarea>
															</div>
		                                                </div>
									                </div>
											    </div>
									        </div>
									      </div> 	

                                          <!-- ##################################################################################### -->
                                          <!--          Etapa Plano de execução da Mudança                                           -->
                                          <!-- ##################################################################################### -->                                                                                                                            
                                          
                                              
										  <!-- Tabela com as informacoes do Recursos a serem cadastrasdos -->                       
											<div class="row">
												<div class="col-sm-12">
													<!-- Basic Form Inputs card start -->
													<div class="card">
														<div class="card-block">
								                            <h5 class="card-header border-primary">Lista de Arquivos da Mudança</h5><hr><br>
															<div style="height: 300px; overflow: scroll;">
																<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaArquivosMudanca">
																	  <thead>
																	    <tr>
																	      <th scope="col">Nome Arquivo  </th>
																	      <th scope="col">Arquivo        </th>
																	      <th scope="col">Extensão       </th>
																	      <th scope="col" class="center">Download         </th>
																	    </tr>
																	  </thead>
																	<tbody id="tbArquivosMudanca">
								
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

							  <div class="row">
								  <div class="col-sm-12">
								 	  <!-- Basic Form Inputs card start -->
									  <div class="row">
										  <div class="col-lg-12">
											<br>
											<button type="button" id="btFecharMudanca" name="btFecharMudanca" class="btn waves-effect waves-light btn-outline-primary float-right pequeno" data-toggle="modal" data-target="#modalFinalizarGMUD" disabled="disabled">Fechar Mudança</button>
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
    <div id="box_dark_form" class="box_dark" > 
       <div class="spinner-border text-info box_modal" ></div>
    </div>

  <div class="modal t-modal primary" id="modalFinalizarGMUD" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered .modal-sm"  style="max-width: 50% !important;" role="document">
		<div class="modal-content">

			<!-- Modal Header -->
	        <div class="modal-header">
	          <h5 class="modal-title" id="TituloModalCentralizado">Fechar GMUD</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body">
				<div class="row">
				  <div class="col-sm-12">
					<div class="card">
					  <div class="card-block">	
					    <div class="form-row">
						  <span  class="font-weight-bold font-italic" style="color: #708090">Status Fechamento</span>
						  <select name="idStatusFechamento" id="idStatusFechamento" class="form-control" required="required" onchange="avaliaTipoPesquisa();">
							<option value="" disabled selected>[-Selecione-]</option>
							<option value="MUDANCA_FIM_SUCESSO">Mudança Concluida com Sucesso</option>
							<option value="MUDANCA_FIM_RESSALVA">Mudança Concluida com Ressalva</option>
							<option value="MUDANCA_FIM_FALHA">Mudança Concluida com Falha</option>
							<option value="MUDANCA_ABORTADA">Mudança Concluida com Abortada</option>
							<option value="MUDANCA_ABORTADA_ROLLBACK">Mudança Concluida com Abortada com Rollback</option>
							<option value="CANCELADA">Cancelada</option>
					     </select> 
					   </div>
				     </div>
				  </div>
			    </div>
			  </div>
		      <hr>  
			  <br>
	          <form>
				<div class="row">
					<div class="col-sm-12">
						<!-- Basic Form Inputs card start -->
						<div class="card">
							<div class="card-block">	
								<div class="form-row">
			                       <span class="font-weight-bold font-italic" style="color: #708090">Plano de testes da Mudança</span>
			                       <textarea style="color: #000000" class="form-control" id="planoTestesFechamento" name="planoTestesFechamento" disabled="disabled" rows="10" ></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<!-- Basic Form Inputs card start -->
						<div class="card">
							<div class="card-block">	
								<div class="form-row">
			                       <span class="font-weight-bold font-italic" style="color: #708090">Plano de retorno da Mudança</span>
			                       <textarea style="color: #000000" class="form-control" id="planoRetornoFechamento" name="planoRetornoFechamento" disabled="disabled" rows="10" ></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
		        
		        <hr>  
			    <br>
				
				<div class="row">
					<div class="col-sm-12">
						<!-- Basic Form Inputs card start -->
						<div class="card">
							<div class="card-block">	
								<div class="form-row">
			                       <span class="font-weight-bold font-italic" style="color: #708090">Report final</span>
			                       <textarea style="color: #000000" class="form-control" id="reportFinalFechamento" name="reportFinalFechamento" rows="10" ></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
	          </form>
	        </div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" id="btModalFechaGMUD" class="btn btn-outline-success" onclick="fecharMudanca( );">Fechar GMUD</button>
                <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Volta</button>			
			</div>
		
		</div>
	</div>

    <div id="box_dark" class="box_dark" > 
       <div class="spinner-border text-info box_modal" ></div>
    </div>

  </div>

  <jsp:include page="modalTranfTarefa.jsp"></jsp:include>
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/transfTarefa.js"></script> 

  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
  <jsp:include page="/util/javascriptfile.jsp"></jsp:include>
   
  <script type="text/javascript">

  $('#modalTrasnferenciaTarefa').on('hide.bs.modal', function () {
		let idMudancaTarefa = document.getElementById('idMudancaParametro').value;
		getListaTarefa( idMudancaTarefa );
  })

  
  getGMUDPassadaParamentro();
  function getGMUDPassadaParamentro() {
	 let urlBase = document.getElementById('urlAPI').value;
     let urlAPI  = urlBase + 'pesquisaMudancaNormal/';

	 idMudancaPar = document.getElementById( 'idMudancaParametro').value; 
//	 urlApi = "http://localhost:8090/PortalMudanca/pesquisaMudancaNormal/" + idMudancaPar.trim();
	 urlApi = urlAPI + idMudancaPar.trim();
	 getGMUDTituloPorId(urlApi)
//	 alert("idMudancaPar: " + idMudancaPar);
  }
  
  function getTarefa( idTarefa ) {
	    let userLogado = document.getElementById('UserLogado').value;
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

		    		$('#btFinalizar'    ).attr('disabled'      , true    );
		    		$('#reportFinal'    ).attr('disabled'      , true    );
		    		$('#btIniciar'      ).attr('disabled'      , true    );
		    		$('#btIniciar'      ).attr("data-toggle"   ,"tooltip");
		    		$('#btIniciar'      ).attr("data-placement","top"    );
		    		$('#btFinalizar'    ).attr("data-toggle"   ,"tooltip");
		    		$('#btFinalizar'    ).attr("data-placement","top"    );
		    		
		    		$('#btFinalizar'    ).attr("title","É necessário iniciar a tarefa antes de fecha-la!");

		            /// Valisda botoes de inico e fim de tarefa
			      	if( response.dt_final_tarefa === null && response.dt_inicio_tarefa !== null ){
			      		$('#btFinalizar'    ).attr('disabled', false);
			      		$('#reportFinal'    ).attr('disabled', false);			    		
			    	}

		            /// Valisda botoes de inico e fim de tarefa
		    		if(  response.dt_inicio_tarefa === null && response.dt_final_tarefa === null )
		            	validaBotoesTarefa( false, true, response.responsavelAtividade.login_responsavel_atividade );
		            else 
		              if( response.dt_inicio_tarefa !== null && response.dt_final_tarefa === null )
		            	  validaBotoesTarefa( true, false, response.responsavelAtividade.login_responsavel_atividade );
		              else 
		            	if( response.dt_inicio_tarefa !== null && response.dt_final_tarefa !== null )
		            		 validaBotoesTarefa( true, true, response.responsavelAtividade.login_responsavel_atividade );
		             
			    }
				document.getElementById('btIniciar').focus();
				hideLoading();
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao Listar Mudanças: " + xhr.responseText);
			hideLoading();
			MensagemConfimacao( "error", "Tarefas", "Erro ao Listar Mudanças: " + xhr.responseText ) ;
		});		 
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
  async function getResponsavelTarefa(){
      let urlBase = document.getElementById('urlAPI').value;
      let urlAPI  = urlBase + 'listaResponsavelAtividade';
      const l_ResponsavelCliente = await fetch(urlAPI).then(response => response.json());
      return l_ResponsavelCliente;
  }
  
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
  
  async function listaTabelaTarefa( tarefas/*, loginUser */){
		let tbody = document.getElementById('tbTarefas');
		tbody.innerText = '';
		let userLogado = document.getElementById('UserLogado').value;
		
//		let l_r_Cliente = await getResponsavelTarefa();
		
		for(let i = 0; i < tarefas.length; i++){
			
			let tr = tbody.insertRow();
/*
	        var idSelect = "id_select_"+i;
	        let valorSelect = "";
	        	        
	        if( tarefas[i].dt_inicio_tarefa !== null || userLogado !== loginUser ){
                const nomeResp   = tarefas[i].responsavelAtividade.responsavel_atividade;
                const idNomeResp = tarefas[i].responsavelAtividade.id_responsavel_atividade;  
                
                let   msn        = "";
                if( userLogado !== loginUser )
                	msn = 'Somente o Owner da GMUD poderá alterar o executor da tarefa!';
                else msn = 'Não é possível alterar o responsável desta tarefa, pois já foi iniciada pelo usuário "' + nomeResp + '"!';
	        	
	        	valorSelect = " <select data-toggle=\"tooltip\" data-placement=\"top\" title=\"" + msn + "\" style=\"text-align: center; vertical-align: middle\" class=\"form-control\" id=\"" + idSelect + "\" >";
	        	valorSelect += "<option value=" + idNomeResp + " selected disabled>" + nomeResp + "</option>"; 
	        	valorSelect += " </select>";	
               
	        }else{
	            valorSelect = " <select style=\"text-align: center; vertical-align: middle\" class=\"form-control\" id=\"" + idSelect + "\" onchange=\"funcUpdateResponsavelAtivade('" + idSelect + "', "  + tarefas[i].id_atividade_mudanca + ", '" + loginUser + "' )\">";
	            for(let j = 0; j < l_r_Cliente.length; j++){
                    if( tarefas[i].responsavelAtividade.id_responsavel_atividade === l_r_Cliente[j].id_responsavel_atividade ) selected = " selected ";
                    else selected = "";	
	                valorSelect += "<option value=" + l_r_Cliente[j].id_responsavel_atividade + " " + selected + ">" + l_r_Cliente[j].responsavel_atividade + "</option>"; 
	            }
	            valorSelect += " </select>";	
	        }			
*/			
	        let td_carregar                  = tr.insertCell();
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
            td_tituloTarefaShow.innerText          = ( tarefas[i].titulo_atividade_mudanca                   !== undefined ? tarefas[i].titulo_atividade_mudanca                   : ''             );
            td_dataTarefaShow.innerText            = ( tarefas[i].dt_tarefa                                  !== undefined ? formatData( 1, tarefas[i].dt_tarefa )                 : ''             );
            td_duracaoTarefaShow.innerText         = ( duracaoFort                                           == ' - ' ? duracaoFort                                                : duracaoFort    );
            td_prioridadefa.innerText              = ( tarefas[i].prioridade                                 !== undefined ? tarefas[i].prioridade                                 : ''             );
            td_descricaoTarefaShow.innerText       = ( tarefas[i].atividade_mudanca                          !== undefined ? tarefas[i].atividade_mudanca                          : ''             );
            td_nomeResponsavelTarefaShow.innerText = ( tarefas[i].responsavelAtividade.responsavel_atividade !== undefined ? tarefas[i].responsavelAtividade.responsavel_atividade : ''             );
            td_dataInicioTarefaShow.innerText      = ( dtInicioTarefa                                        !== ' - ' ? formatData( 2, dtInicioTarefa )                           : dtInicioTarefa );
            td_dataFimTarefaShow.innerText         = ( dtFinalTarefa                                         !== ' - ' ? formatData( 2, dtFinalTarefa   )                          : dtFinalTarefa  );
            
 //           td_nomeResponsavelTarefaShow.outerHTML = valorSelect; // Selecte de Responsavel pela Tarefa, caso seja necess'ario alterar.
            
            let imgcarregar = document.createElement('img');
            imgcarregar.src = getContextPath() +'/imagens/mostrar-propriedade.-48.png';
            imgcarregar.setAttribute('onclick','getTarefa( ' +  tarefas[i].id_atividade_mudanca + ' )');
            td_carregar.appendChild(imgcarregar);
            td_carregar.classList.add('center');
            imgcarregar.setAttribute( 'cursor', 'pointer' );

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
        }
	}

  function listaArquivosAnexados( arquivosMudanca ){
		let tbody = document.getElementById('tbArquivosMudanca');
		tbody.innerText = '';
		for(let i = 0; i < arquivosMudanca.length; i++){
			// Cria as linhas
            let tr = tbody.insertRow();
            
            // Crias as celulas
            let td_tituloArquivo  = tr.insertCell();
            let td_nomeArquivo    = tr.insertCell();
            let td_extensaoArq    = tr.insertCell();
            let td_download       = tr.insertCell();

            // Inseri os valores do objeto nas celulas
            td_tituloArquivo.innerText = ( arquivosMudanca[i].titulo_arquivo !== undefined ? arquivosMudanca[i].titulo_arquivo : '' );
            td_nomeArquivo.innerText   = ( arquivosMudanca[i].nome_arq       !== undefined ? arquivosMudanca[i].nome_arq       : '' );
            td_extensaoArq.innerText   = ( arquivosMudanca[i].tipo_Arq       !== undefined ? arquivosMudanca[i].tipo_Arq       : '' );
            
            
            let imgcarregar = document.createElement('img');
            imgcarregar.src = getContextPath() +'/imagens/baixar-48.png';
            let funcDownload = "downloadBase64( '" + arquivosMudanca[i].arquivo  + "', '" 
                                                  + arquivosMudanca[i].nome_arq + "', '" 
                                                  + arquivosMudanca[i].tipo_Arq +"' )";
            
            imgcarregar.setAttribute('onclick',funcDownload);
            td_download.appendChild(imgcarregar);
            td_download.classList.add('center');

		}
  }
  
  
  function muntaTela( mudanca ) {
//	console.log( mudanca );
	// Dados da GMUD
	$('#tituloMudanca'           ).val( mudanca.titulo_mudanca                          );
	$("#login"                   ).val( mudanca.login_user                              );
	$("#idStatus"                ).val( formatstatusGmud( mudanca.statusMudanca )       );
	$("#tipoMudanca"             ).val( mudanca.tipoMudanca.tipo_mudanca                );
	$('#impactoMudanca'          ).val( mudanca.impactoMudanca.impacto_mudanca          );
	$("#urgenciaMudanca"         ).val( mudanca.criticidade.criticidade                 );
	$("#dataExecucao"            ).val( formatData( 1,  mudanca.dadosMudanca.dt_inicio ));
	$("#horarioInicio"           ).val( mudanca.dadosMudanca.hr_inicio                  );
	$('#dataPrevistaConclusao'   ).val( formatData( 1,  mudanca.dadosMudanca.dt_final ) );
	$("#HorarioPrevistoConclusao").val( mudanca.dadosMudanca.hr_final                   );
	$("#descricaoMudanca"        ).val( mudanca.dadosMudanca.dsc_mudanca                );
	$("#justificativaMudanca"    ).val( mudanca.dadosMudanca.justificativa_mudanca      );
	$("#reportFinal"             ).val( mudanca.reportFinal                             );
    /////////////////////////////////////////////////////////////////////////////////////////////
    // Informacoes das Acoes Finais na Modal
    $("#planoRetornoFechamento"  ).val( mudanca.acaoPosAtividade.plano_teste            );
	$("#planoTestesFechamento"   ).val( mudanca.acaoPosAtividade.plano_rollback         );
    
    listaTabelaTarefa( mudanca.atividadesMudanca/*, mudanca.login_user*/ );
    
    listaArquivosAnexados( mudanca.arquivosMudanca );
    
//    console.log( "statusMudanca: " + mudanca.statusMudanca );
    
    if( mudanca.statusMudanca !== "CANCELADA"            && mudanca.statusMudanca !== "REJEITADA"         && mudanca.statusMudanca !== "MUDANCA_FIM_SUCESSO" && 
    	mudanca.statusMudanca !== "MUDANCA_FIM_RESSALVA" && mudanca.statusMudanca !== "MUDANCA_FIM_FALHA" && mudanca.statusMudanca !== "MUDANCA_ABORTADA"    &&
    	mudanca.statusMudanca !== "MUDANCA_ABORTADA_ROLLBACK" ){
        $('#btFecharMudanca').attr('disabled', false);
    }else {
    	$('#btFecharMudanca').attr('disabled', true);
    }
    
	
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

  function getGMUDTituloPorId(urlAPI){

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
			    	muntaTela( response );
			    }
				hideLoading();
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao Listar Mudanças: " + xhr.responseText);
			hideLoading();
			MensagemConfimacao( "error", "Mudanças", "Erro ao Listar Mudanças por Título: " + xhr.responseText ) ;
		});		
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

	/******************************************************************/
	/*                                                                */
	/*                                                                */
	/******************************************************************/
	async function iniciarTarefa( ) {
		try {
			 showLoading();
			 let idTarafaInici = document.getElementById( 'idTarefaAux' ).value; 
			 let idMudInici    = document.getElementById( 'idMudancaAux').value; 
			 let loginRes      = document.getElementById( 'login'       ).value; 
			 
			 const checkReturn = await checkPrioridadeTarefa( idMudInici, idTarafaInici )
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
				 MensagemConfimacaoModal("success","Inicializacao de Tarefas", msg, "modalExecucaoTarefaGMUD");
				 getListaTarefa( idMudInici );
				 await validaBotoesTarefa( true, false, loginRes );
			 }else {
				msg = "ERRO: Ao Inicializada Tarefa " + id + "!";
				MensagemConfimacaoModal("error","Inicializacao de Tarefas", msg, "modalExecucaoTarefaGMUD");
			 }
			 
			 hideLoading();
			 
		} catch (error) {
			 hideLoading();
			 MensagemConfimacaoModal( "error", "Tarefas",  error, "modalExecucaoTarefaGMUD" );
		 }
	}
  
  function finalizarTarefa( ){

		let idTarafaInici = document.getElementById( 'idTarefaAux' ).value; 
		let idMudInici    = document.getElementById( 'idMudancaAux').value; 
		let reportFinalF  = document.getElementById( 'reportFinal' ).value;
		let loginRes      = document.getElementById( 'login'       ).value; 
		
		if( reportFinalF.trim() == ''){ 
			
			MensagemConfimacao("warning","Finalizar Tarefa", "Favor preencher o Report Final!");
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
//			url : "http://localhost:8090/PortalMudanca/finalizaTarefa/" + idTarafaInici + "/" + reportFinalF,
//			url : urlAPI + idTarafaInici + "/" + reportFinalF,
            url         : urlAPI                           ,
			contentType : "application/json; charset=utf-8"  ,
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
				    MensagemConfimacao("success","Finalizar Tarefa", msg);
				    getListaTarefa( idMudInici );
				    validaBotoesTarefa( true, true, loginRes );
				}else 
					if( response === 'TAREFA_NAO_INICIADA' ){
						msg = "A Tarefa " + idTarafaInici + " não Inicializada! Ela só podera ser finalizada, após ser iniciada e executada!";
						MensagemConfimacao("error","Finalizar Tarefa", msg);
				}
				else{
					msg = "ERRO: Ao Finalizar Tarefa " + idTarafaInici + "!";
					MensagemConfimacao("error","Finalizar Tarefa", msg);
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
						  });
			}else{
				Swal.fire({
				    icon  : "error"                             ,
				    title : "Salvar GMUD"                       ,
				    text  : "Erro ao salvar GMUD: " + xhr.responseText ,
				    }
				);
			}
		});
		
  }
 
  function getListaTarefa( idMudancaTarefa ){
		let urlBase = document.getElementById('urlAPI').value;
	    let urlAPI  = urlBase + 'obterListaAtividadeMudanca/';

		$.ajax({
			method : "GET",
//			url : "http://localhost:8090/PortalMudanca/obterListaAtividadeMudanca/" + idMudancaTarefa,
			url : urlAPI + idMudancaTarefa,
			contentType : "application/json; charset=utf-8",
			beforeSend: function( xhr ) {
				   showLoading();
				},
			success : function(response) {
//				console.log("response: " + response);
				
				if( response.error !== undefined ){
				    MensagemConfimacao( "error", "Pesquisa Tarefa: ", response.error );				    
			    }else{
			    	listaTabelaTarefa( response/*, response.login_user*/ ); 
			    }
				hideLoading();
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao Listar Tarefas: " + xhr.responseText);
			hideLoading();
			MensagemConfimacao( "error", "Tarefas", "Erro ao Listar Tarefas: " + xhr.responseText) ; 
		});
  }
  

  /******************************************************************/
  /*                                                                */
  /*                                                                */
  /******************************************************************/
  function getContextPath() {
     return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
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

  
  
  function MensagemConfimacaoModal( iconi, tituloPrincipal, textoPrincipal, nomeModal ) {
		  Swal.fire({
			    icon  : iconi                             ,
			    title : tituloPrincipal                   ,
			    text  : textoPrincipal                    ,
			    target: document.getElementById(nomeModal),
			    }
			);	    		
  }
 
  function downloadBase64( base64Data, fileName, extension ) {
/*
     let typeArq = "application/" + extension;
     
     var blob = new Blob( [base64Data], { type: typeArq } );
     var link = document.createElement("a");
     link.href = window.URL.createObjectURL( blob );
     link.download = fileName;
     link.click();	
     
*/     
	     const link = document.createElement("a");
	     link.href = base64Data;
	     link.download = fileName;
	     link.click();	
  }

  async function validaFechamento() {

	  
//	 let planoTestesFec  = document.getElementById( 'planoTestesFechamento' ).value;
//	 let planoRetornoFec = document.getElementById( 'planoRetornoFechamento').value;
	 let reportFinalFec  = document.getElementById( 'reportFinalFechamento' ).value;
	 let idStatusFec     = document.getElementById( 'idStatusFechamento'    ).value;
	 
	 if( idStatusFec.trim() === ''){
		 // MensagemConfimacaoModal( "warning", "Fechamento de GMUD",  "Favor escolher um Status para o Fechamento!", "modalFinalizarGMUD" );
		 
		 return "Favor escolher um Status para o Fechamento!";
	 }
/*
	 if( ( idStatusFec === 'MUDANCA_FIM_RESSALVA' || idStatusFec === 'MUDANCA_FIM_SUCESSO' || idStatusFec === 'MUDANCA_FIM_RESSALVA' ) && planoTestesFec.trim() === ''){
		 MensagemConfimacaoModal( "warning", "Fechamento de GMUD",  "Favor preencher o campo 'Plano de testes da Mudança'!", "modalFinalizarGMUD" );
		 return false;
	 }

	 if( ( idStatusFec === 'MUDANCA_ABORTADA_ROLLBACK' || idStatusFec === 'MUDANCA_FIM_FALHA' ) && planoRetornoFechamento.trim() === ''){
		 MensagemConfimacaoModal( "warning", "Fechamento de GMUD",  "Favor preencher o campo 'Plano de retorno da Mudança'!", "modalFinalizarGMUD" );
		 return false;
	 }
*/	
	 if( reportFinalFec.trim() === ''){
		// MensagemConfimacaoModal( "warning", "Fechamento de GMUD",  "Favor preencher o campo 'Report final!'", "modalFinalizarGMUD" );
		 return "Favor preencher o campo 'Report final!'";
	 }
	 
	 return 'OK';
 }   

 $('#modalFinalizarGMUD').on('hidden.bs.modal', function (e) {
	$('#idStatusFechamento'    ).get(0).selectedIndex = 0;
//	$("#planoTestesFechamento" ).val("");
//	$("#planoRetornoFechamento").val("");
	$("#reportFinalFechamento" ).val("");
 })

 async function fecharMudanca( ){
    let idMudancaTar     = document.getElementById( 'idMudancaParametro'    ).value;
    let urlBase = document.getElementById('urlAPI').value;
    let urlAPI  = urlBase + 'qtyAtitividadesAbertas/' + idMudancaTar;
    $('#btFecharMudanca').attr('disabled', true);
    $('#btModalFechaGMUD').attr('disabled', true);    
    ExecutaFechamentoGMUD( urlAPI );
 }
 
 // Funcoes com async/await
 async function ExecutaFechamentoGMUD(url) {
     try {
      	showLoading(); 
     	 // valida se os dados foram preenchidos corretamente.
    	const validacao = await validaFechamento();
        if( validacao !== 'OK'  ) throw validacao;  
    	 
         const data1 = await fetch(url).then(response => response.json());

         if( data1 > 0  ) throw 'Fecha todas as terefas, para fechar a GMUD!';

         // Se todas as tarefas forem fechadas, executa o fechamento da GMUD
       	 let idMudancaTar = document.getElementById( 'idMudancaParametro'    ).value;
   	     let reportFinal  = document.getElementById( 'reportFinalFechamento' ).value;
   	     let urlBase      = document.getElementById( 'urlAPI'                ).value;
   	     let idStatusFec  = document.getElementById( 'idStatusFechamento'    ).value;

//   	     let urlAPI       = urlBase + 'updadeStatuFechamentoGMUD/' + idStatusFec.trim() + "/" +idMudancaTar + "/" + reportFinal;
   	     let urlAPI       = urlBase + 'updadeStatuFechamentoMudancaDTO';
   	     let caminhoUrlPricipal = getContextPath() + "/principal/telaPrincipal.jsp";

 		 let dados = {
	 				idMudanca   : idMudancaTar      ,
	 				statusGMUD  : idStatusFec.trim(),
	 				reportFinal : reportFinal.trim()
			 };  
	 		 
	     const data2 = await fetch(urlAPI, {
							        	  method : 'post',
							        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
							        	  body   : JSON.stringify( dados )
							        	}).then(response => response.text())
							        	  .then(body => { return body; });

 //         console.log( data2 );
         
         if( data2 === 'sucesso' ){

			 Swal.fire({
				   title: "Fechamento de GMUD",
				   text : "Mudança fechada com sucesso!",
				   icon : "success",
				   target: document.getElementById("modalFinalizarGMUD"),
				   showCancelButton: false,
				   confirmButtonColor: "#3085d6",
				   cancelButtonColor: "#d33",
				   confirmButtonText: "OK"
				 }).then((result) => {
				   if (result.isConfirmed) {
				       window.location = caminhoUrlPricipal;
				   }
				 });				 
        	 
//             MensagemConfimacaoModal( "success", "Fechamento de GMUD",  "Todas as Tarefas devem ser encerradas antes do fechamento da GMUD.", "modalFinalizarGMUD" );	
//             getGMUDPassadaParamentro();
//             jQuery('#modalFinalizarGMUD').modal('hide');
//             $('#modalFinalizarGMUD').modal('hide'); 
         }else {
             msg = "ERRO: no Fechamento de GMUD!";
             MensagemConfimacaoModal( "error", "Fechamento de GMUD",  msg, "modalFinalizarGMUD");
             $('#btFecharMudanca').attr('disabled', false);
             $('#btModalFechaGMUD').attr('disabled', false); 
         }
         hideLoading();
     } catch (error) {
         // console.log(error);
         hideLoading();
    	 MensagemConfimacaoModal( "warning", "Fechamento de GMUD",  error, "modalFinalizarGMUD" );
    	 $('#btFecharMudanca').attr('disabled', false);
    	 $('#btModalFechaGMUD').attr('disabled', false); 
     }
 }

 function showLoading(){
	$("#box_dark").css('display','flex');
	$("#box_dark_form").css('display','flex');
 }

 function hideLoading(){
	$("#box_dark").css('display','none');
	$("#box_dark_form").css('display','none');
 }
 
 
</script>
    
</body>

</html>
