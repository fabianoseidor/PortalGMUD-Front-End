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
										  	<h5 class="m-b-1">Portal de GMUD - Cadastro de Mudan�a Emergencial</h5>
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
								    <h3 class="text-muted">Cadastro de Mudan�a Emergencial - Passo <samp id="passo"></samp></h3>
								    <br>
                                    <form class="form-material formCadMudancaEmergencialValidacao" action="" method="post" id="formCadMudancaEmergencia" enctype="multipart/form-data">
                                            <!-- ##################################################################################### -->
                                            <!--          Etapa Dados de Identifica��o da Mudan�a!                                     -->
                                            <!-- ##################################################################################### -->                                    
                                            <div id="step_1" class="step">
                                                 <div class="row">
													<div class="col-sm-12">
														<div class="card">
															<div class="card-block">
					                                            <div class="form-row">
						                                            <!-- Email do uduario de abertura -->
						                                            <input type="hidden"  name="emailSolicitante" id="emailSolicitante" value="<%=session.getAttribute("emailSolicitante")%>">
						                                    
						                                            <!-- URL da base da API Base TST ou PRD  -->
						                                            <input type="hidden"  name="urlAPI" id="urlAPI" value="<%=session.getAttribute("urlAPI")%>">

																	<div class="form-group form-default form-static-label col-md-6 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >T�tulo da mudan�a</span>
																	     <input style="color: #000000" type="text" name="tituloMudanca" id="tituloMudanca" class="form-control step_1_validar" placeholder="T�tulo da mudan�a" value="">
																	</div>
																	 
																	<div class="form-group form-default form-static-label col-md-2 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Login</span>
																	     <input style="color: #000000" type="text" name="login" id="login" readonly="readonly" class="form-control" value="<%=session.getAttribute("usuario")%>">
																	</div>
																	<div class="form-group form-default form-static-label col-md-2 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Status</span>
																	     <input style="color: #000000" type="text" name="idStatus" id="idStatus" readonly="readonly" class="form-control" value="Em processo de abertura">
																	</div>
																	
																	<div class="form-group form-default form-static-label col-md-2 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Tipo de Mudan�a</span>
																	     <input style="color: #000000" type="text" name="tipoMudanca" id="tipoMudanca" readonly="readonly" class="form-control" value="Emergencia">
																	</div>
																	  
															    </div>
																<hr>  
																<br>
																<div class="form-row">
																	<div class="form-group form-default form-static-label col-md-6 mb-4">
																		<span  class="font-weight-bold font-italic" style="color: #708090">Impacto da Mudan�a</span>
																		<select style="color: #000000" name="impactoMudanca" id="impactoMudanca" class="form-control step_1_validar" >
																			<option value="" disabled selected>[-Selecione-]</option>
																		</select> 
																	</div>
				
																	<div class="form-group form-default form-static-label col-md-6 mb-4">
																		<span  class="font-weight-bold font-italic" style="color: #708090">Urg�ncia da Mudan�a</span>
																		<select style="color: #000000" name="urgenciaMudanca" id="urgenciaMudanca" class="form-control step_1_validar" >
																			<option value="" disabled selected>[-Selecione-]</option>
																		</select> 
																	</div>
																</div>	
																<hr>  
																<br>
																<div class="form-row">
																	<div class="form-group form-default form-static-label col-md-3 mb-6" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Data de Execu��o</label>
																	    <input style="color: #000000" type="text" name="dataExecucao" id="dataExecucao" class="form-control step_1_validar" onchange="validaDateExecucao();">								     
																	</div>	
																	
																	<div class="form-group form-default form-static-label col-md-3 mb-6" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Horario de Inicio</label>
																	    <input style="color: #000000" type="time" name="horarioInicio" id="horarioInicio" class="form-control step_1_validar" onchange="validacaoDataHoraInicioGMUD();">								     
																	</div>	
				
																	<div class="form-group form-default form-static-label col-md-3 mb-6" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Data prevista de conclus�o</label>
																	    <input style="color: #000000" type="text" name="dataPrevistaConclusao" id="dataPrevistaConclusao" class="form-control step_1_validar" onchange="validaDateConclusao();">								     
																	</div>	
																	
																	<div class="form-group form-default form-static-label col-md-3 mb-6" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Horario previsto para conclus�o</label>
																	    <input style="color: #000000" type="time" name="HorarioPrevistoConclusao" id="HorarioPrevistoConclusao" class="form-control step_1_validar" onchange="validacaoDataHoraFimGMUD();atualizaInfoJanela();">								     
																	</div>	
				
																</div>
																
																<hr>  
																<br>
																<div class="form-row">
																	<div class="form-group form-default form-static-label col-md-12 mb-12">
																	     <span class="font-weight-bold font-italic" style="color: #708090">Descri��o da mudan�a</span>
																	     <textarea style="color: #000000" class="form-control step_1_validar" id="descricaoMudanca" name="descricaoMudanca" placeholder="Observa��o" rows="100" ></textarea>
																	</div>
																</div>
																
																<hr>  
																<br>
																
																<div class="form-row">
																	<div class="form-group form-default form-static-label col-md-12 mb-12">
																	     <span class="font-weight-bold font-italic" style="color: #708090">Justificativa da mudan�a</span>
																	     <textarea style="color: #000000" class="form-control step_1_validar" id="justificativaMudanca" name="justificativaMudanca" placeholder="Observa��o" rows="100" ></textarea>
																	</div>
																</div>
												
												            </div>
												        </div>
												    </div>
												 </div>
                                            </div>

                                            <!-- ##################################################################################### -->
                                            <!--          Etapa Plano de comunicacao!                                                  -->
                                            <!-- ##################################################################################### -->                                    
                                            <div id="step_2" class="step">

                                                 <div class="row">
												    <div class="col-sm-12">
												        <div class="card">
														    <div class="card-block">
														        <h5 class="card-title">Sess�o para sele��o dos 'Aprovadores' da GMUD</h5><hr>
				                                                <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-4 mb-4">
																		<span  class="font-weight-bold font-italic" style="color: #708090">Aprovadores</span>
																		<select style="color: #000000" name="selectAprovadores" id="selectAprovadores" class="form-control" onchange="preencheSelectAprovadores()" >
																			<option value="" disabled selected>[-Selecione-]</option>
																		</select> 
																    </div>
															    </div>
				 
																<div class="form-row">
																	<div class="form-group form-default form-static-label col-md-4 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >ID Aprovador</span>
																	     <input style="color: #000000" type="text" name="idAprovador" id="idAprovador" readonly="readonly" class="form-control" value="">
																	</div>
				
																	<div class="form-group form-default form-static-label col-md-4 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Aprovador</span>
																	     <input style="color: #000000" type="text" name="nomeAprovador" id="nomeAprovador" readonly="readonly" class="form-control" value="">
																	</div>
				
																	<div class="form-group form-default form-static-label col-md-4 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >E-mail</span>
																	     <input style="color: #000000" type="email" name="emailAprovador" id="emailAprovador" readonly="readonly" class="form-control" value="">
																	</div>
															    </div>
											    
																<hr>  
																<br>
																<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btAddAprovadores" id="btAddAprovadores" onclick="mudancaEmergencial.salvarAprovadores();">Add</button>
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
									
																<div style="height: 150px; overflow: scroll;">
																	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaAprovadores">
																		  <thead>
																		    <tr class="table-primary">
																		      <th scope="col" style="vertical-align: middle;color: white">ID Aprovador</th>
																		      <th scope="col" style="vertical-align: middle;color: white">Aprovador   </th>
																		      <th scope="col" style="vertical-align: middle;color: white">E-mail      </th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete      </th>
																		    </tr>
																		  </thead>
																		<tbody id="tbAprovadores">
									
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
															    <h5 class="card-title">Sess�o para sele��o dos 'Arquivos de Aprova��o' do(s) Cliene(s)</h5><hr>
															    <div class="form-row">
															         <div class="form-group form-default form-static-label col-md-12 mb-12">
																		  <label for="arqUploadAprovCliente" class="form-label">Selecionar Arquivo</label>
																		  <input class="form-control form-control-lg" name="arqUploadAprovCliente" id="arqUploadAprovCliente" type="file" onchange="getNameArqAprovCliente( 'arqUploadAprovCliente' );" />
															         </div>
				                                                </div>
															    <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-5">
																	     <label  class="font-weight-bold font-italic" style="color: #708090" >T�tulo Arq. Aprova��o Cliente</label>
																	     <input style="color: #000000" type="text" name="tituloArqAprovCliente" id="tituloArqAprovCliente" class="form-control">
																	</div>
				                                                </div>
				                                                <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-5">
																	     <label  class="font-weight-bold font-italic" style="color: #708090" >Nome Arq. Aprova��o Cliente</label>
																	     <input style="color: #000000" type="text" name="nomeArqAprovCliente" id="nomeArqAprovCliente" class="form-control" readonly="readonly">
																	</div>
				 													<div class="form-group form-default form-static-label col-md-5" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Arquivo Aprova��o Cliente</label>
																	    <input style="color: #000000" type="text" name="caminhoArqAprovCliente" id="caminhoArqAprovCliente" class="form-control" readonly="readonly">								     
																	</div>	
																	<div class="form-group form-default form-static-label col-md-2" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Extens�o Arq.</label>
																	    <input style="color: #000000" type="text" name="extensaoArqAprovCliente" id="extensaoArqAprovCliente" class="form-control" readonly="readonly">								     
																	</div>	
				                                                </div>
																<hr>  
																<br>
																<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btAddAprovCliente" id="btAddAprovCliente" onclick="mudancaEmergencial.salvarArquivoAprovCliente();">Add</button>
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
									
																<div style="height: 150px; overflow: scroll;">
																	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaArquivosMudancaAprovCliente">
																		  <thead>
																		    <tr class="table-primary">
																		      <th scope="col" style="vertical-align: middle;color: white">Nome Arquivo   </th>
																		      <th scope="col" style="vertical-align: middle;color: white">Arquivo        </th>
																		      <th scope="col" style="vertical-align: middle;color: white">Caminho Arquivo</th>
																		      <th scope="col" style="vertical-align: middle;color: white">Extens�o       </th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete         </th>
																		    </tr>
																		  </thead>
																		<tbody id="tbArquivosMudancaAprovCliente">
									
																		</tbody>
																	</table>
																</div>
									
															</div>
														</div>
													</div>
												</div>

                                            </div>
                                            
                                            <!-- ##################################################################################### -->
                                            <!--          Etapa Plano de execu��o da Mudan�a                                           -->
                                            <!-- ##################################################################################### -->                                                                                
                                            <div id="step_3" class="step">
                                                 <div class="row">
													<div class="col-sm-12">
														<div class="card">
															<div class="card-block">
															    <h5 class="card-title">Sess�o para sele��o dos 'Clientes Afetados'</h5><hr>
				                                                <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-6 mb-4">
																		<span  class="font-weight-bold font-italic" style="color: #708090">Clientes Afetados</span>
																		<select style="color: #000000" name="selectClientesAfetados" id="selectClientesAfetados" class="form-control" onchange="funcSelectClientesAfetados()">
																			<option value="" disabled selected>[-Selecione-]</option>
																		</select> 
																    </div>
																    
																	<div class="form-group form-default form-static-label col-md-2 mb-4">
																		<span  class="font-weight-bold font-italic" style="color: #708090">Ciclo Update Cliente</span>
																		<select style="color: #000000" name="selectCicloUpdateCliente" id="selectCicloUpdateCliente" class="form-control" onchange="listaClientesAfetadosPorCiclo( this.value )">
																			<option value="" disabled selected>[-Selecione-]</option>
																		</select> 
																    </div>
																    
															    </div>
				                                                
				                                                <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-6 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >ID Cliente</span>
																	     <input style="color: #000000" type="text" name="idClienteAfetado" id="idClienteAfetado" readonly="readonly" class="form-control" value="">
																	</div>
				
																	<div class="form-group form-default form-static-label col-md-6 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Cliente</span>
																	     <input style="color: #000000" type="text" name="nomeClienteAfetado" id="nomeClienteAfetado" readonly="readonly" class="form-control" value="">
																	</div>
															    </div>
																<hr>  
																<br>
																<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btAddClientesAfetado" id="btAddClientesAfetado" onclick="mudancaEmergencial.salvarClientesAfetado();">Add</button>
																<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btLimparAddClientesAfetado" id="btLimparAddClientesAfetado" onclick="mudancaEmergencial.limparListaClientesAfetados();">Limpar Lista</button>
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
									
																<div style="height: 250px; overflow: scroll;">
																	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaClienteAfetado">
																		  <thead>
																		    <tr class="table-primary">
																		      <th scope="col" style="vertical-align: middle;color: white"                    >ID Cliente    </th>
																		      <th scope="col" style="vertical-align: middle;color: white"                    >Cliente       </th>
																		      <th scope="col" style="vertical-align: middle;color: white"                    >Ciclo Updadate</th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete        </th>
																		    </tr>
																		  </thead>
																		<tbody id="tbClienteAfetado">
									
																		</tbody>
																	</table>
																</div>
									
															</div>
														</div>
													</div>
												</div>

												<hr>  
												<br>
												
                                                 <div class="row">
													<div class="col-sm-12">
														<div class="card">
															<div class="card-block">
															    <h5 class="card-title">Sess�o para sele��o dos Contatos para o 'Plano de Comunica��o'</h5><hr>
																<div class="form-row">
																	<div class="form-group form-default form-static-label col-md-5 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Nome Contato</span>
																	     <input style="color: #000000" type="text" name="pcNomeContato" id="pcNomeContato" class="form-control" value="">
																	</div>
				
																	<div class="form-group form-default form-static-label col-md-4 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Empresa</span>
																	     <input style="color: #000000" type="text" name="pcEmpresa" id="pcEmpresa" class="form-control" value="">
																	</div>
				
																	<div class="form-group form-default form-static-label col-md-3 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >E-mail</span>
																	     <input style="color: #000000" type="email" name="pcEmail" id="pcEmail" class="form-control" value="">
																	</div>
															    </div>
															    
																<hr>  
																<br>
																<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btAddPlanoComunicacao" id="btAddPlanoComunicacao" onclick="mudancaEmergencial.salvarPlanoComunicacao();">Add</button>
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
									
																<div style="height: 150px; overflow: scroll;">
																	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaPlanoComunicacao">
																		  <thead>
																		    <tr class="table-primary">
																		      <th scope="col" style="vertical-align: middle;color: white">Nome Contato   </th>
																		      <th scope="col" style="vertical-align: middle;color: white">Empresa        </th>
																		      <th scope="col" style="vertical-align: middle;color: white">E-mail         </th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete         </th>
																		    </tr>
																		  </thead>
																		<tbody id="tbPlanoComunicacao">
									
																		</tbody>
																	</table>
																</div>
									
															</div>
														</div>
													</div>
												</div>
                                            </div>
                                            
                                            <!-- ##################################################################################### -->
                                            <!--          Etapa Plano de execu��o da Mudan�a                                           -->
                                            <!-- ##################################################################################### -->                                                                                
                                            <div id="step_4" class="step">
                                                 <div class="row">
													<div class="col-sm-12">
														<div class="card">
															<div class="card-block">

				                                                <div class="form-row" style="display: flex; align-items: center;">
																	<div class="form-group form-default form-static-label col-md-3 mb-4">
																		<span  class="font-weight-bold font-italic" style="color: #708090">Respons�vel Tarefa</span>
																		<select style="color: #000000" name="selectResponsavelTarefa" id="selectResponsavelTarefa" class="form-control" onchange="funcSelectResponsavelTarefa()" >
																			<option value="" disabled selected>[-Selecione-]</option>
																		</select> 
																    </div>

																    <div class="form-group form-default form-static-label col-md-3 mb-4">
																         <span  class="font-weight-bold font-italic" style="color: #708090">Prioridade</span>
																		 <input style="color: #000000" type="number" min="1" max="50" name="prioridade" id="prioridade" class="form-control">								     
															        </div>
																    
																    <div class="form-group form-default form-static-label col-md-2 mb-4">
																	     <div class="form-check form-check-inline">
																		   <input class="form-check-input" type="checkbox" id="checkBoxIndisp" value="option1">
																		   <label class="form-check-label" for="checkBoxIndisp">Indisponibilidade</label>
																		 </div>
																    </div>
																    
																    <div class="form-group form-default form-static-label col-md-2 mb-4">
																	     <div class="form-check form-check-inline">
																		   <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
																		   <label class="form-check-label" for="inlineCheckbox2">Tarefa autom�tico</label>
																		 </div>
																    </div>
																    
																    <div class="form-group form-default form-static-label col-md-2 mb-4">
																		<div class="form-check form-check-inline">
																		  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" >
																		  <label class="form-check-label" for="inlineCheckbox3">Enviar E-mail</label>
																		</div>
																    </div>
															    </div>
				
															    <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-2 mb-2">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >ID Respons�vel Tarefa</span>
																	     <input style="color: #000000" type="text" name="idResponsavelTarefa" id="idResponsavelTarefa" readonly="readonly" class="form-control" value="">
																	</div>
																	<div class="form-group form-default form-static-label col-md-4 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Respons�vel Tarefa</span>
																	     <input style="color: #000000" type="text" name="nomeResponsavelTarefa" id="nomeResponsavelTarefa" readonly="readonly" class="form-control" value="">
																	</div>
				
																	<div class="form-group form-default form-static-label col-md-6 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >E-mail</span>
																	     <input style="color: #000000" type="text" name="emailResponsavelTarefa" id="emailResponsavelTarefa" readonly="readonly" class="form-control" value="">
																	</div>
															    </div>
				
				                                                <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-8">
																	     <label  class="font-weight-bold font-italic" style="color: #708090" >T�tulo Tarefa</label>
																	     <input style="color: #000000" type="text" name="tituloTarefa" id="tituloTarefa" class="form-control">
																	</div>
																	
				 													<div class="form-group form-default form-static-label col-md-2" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Data Tarefa</label>
																	    <input style="color: #000000" type="text" name="dataTarefa" id="dataTarefa" class="form-control" onchange="validacaoDtTarefaDentroDtGMUD();">
																	    <strong style="color: #DF0101">Janela GMUD: </strong> <em><span id="info" style="color: #FF4000">${info}</span></em>								     
																	</div>	
																	
																	<div class="form-group form-default form-static-label col-md-2" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Dura��o Tarefa</label>
																	    <input style="color: #000000" type="time" name="duracaoTarefa" id="duracaoTarefa" class="form-control" onchange="validacaoDataHoraTarefaJanelaGMUD();"  onclick="iniciarTimeDuracao()">								     
																	</div>	
				                                                </div>
				                                                
				                                                <div class="from-row">
																	<div class="form-group form-default form-static-label col-md-12 mb-12" >
																	     <span class="font-weight-bold font-italic" style="color: #708090">Descri��o Tarefa</span>
																	     <textarea style="color: #000000" class="form-control" id="descricaoTarefa" name="descricaoTarefa" placeholder="Observa��o" rows="100" ></textarea>
																	</div>
				                                                </div>
																<hr>  
																<br>
																<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btAddTarefa" id="btAddTarefa" onclick="mudancaEmergencial.salvarTarefa();">Add</button>
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
									
																<div style="height: 150px; overflow: scroll;">
																	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaTarefas">
																		  <thead>
																		    <tr class="table-primary">
																		      <th scope="col" style="vertical-align: middle;color: white"                    >T�tulo Tarefa     </th>
																		      <th scope="col" style="vertical-align: middle;color: white"                    >Data Tarefa       </th>
																		      <th scope="col" style="vertical-align: middle;color: white"                    >Dura��o Tarefa    </th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Prioridade        </th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Indisponibilidade </th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Enviar E-mail     </th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Tarefa Autom�tica </th>
																		      <th scope="col" style="vertical-align: middle;color: white"                    >Descri��o Tarefa  </th>
																		      <th scope="col" style="vertical-align: middle;color: white"                    >Respons�vel Tarefa</th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete</th>
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

                                            </div>
                                            <!-- ##################################################################################### -->
                                            <!--          Etapa A��es p�s atividades                                                   -->
                                            <!-- ##################################################################################### -->                                                                                                                            
                                            <div id="step_5" class="step">
                                                 <div class="row">
													<div class="col-sm-12">
														<div class="card">
															<div class="card-block">

				                                                <div class="from-row">
																	<div class="form-group form-default form-static-label col-md-12 mb-12">
																	     <span class="font-weight-bold font-italic" style="color: #708090">Plano de Testes</span>
																	     <textarea style="color: #000000" class="form-control step_5_validar" id="planoTestes" name="planoTestes" placeholder="Plano de Testes" rows="100" ></textarea>
																	</div>
				                                                </div>

																<hr>  
																<br>
				                                                
				                                                <div class="from-row">
																	<div class="form-group form-default form-static-label col-md-12 mb-12">
																	     <span class="font-weight-bold font-italic" style="color: #708090">Plano de Retorno</span>
																	     <textarea style="color: #000000" class="form-control step_5_validar" id="planoRetorno" name="planoRetorno" placeholder="Plano de Retorno" rows="100" ></textarea>
																	</div>
				                                                </div>
											                </div>
													    </div>
											        </div>
											     </div> 	
                                            </div>
                                            <!-- ##################################################################################### -->
                                            <!--          Etapa Plano de execu��o da Mudan�a                                           -->
                                            <!-- ##################################################################################### -->                                                                                                                            
                                            <div id="step_6" class="step">
                                                 <div class="row">
													<div class="col-sm-12">
														<div class="card">
															<div class="card-block">
															    <div class="form-row">
															         <div class="form-group form-default form-static-label col-md-12 mb-12">
																		  <label for="arqUpload" class="form-label">Selecionar Arquivo</label>
																		  <input class="form-control form-control-lg" name="arqUpload" id="arqUpload" type="file" onchange="getNameArq( 'arqUpload' );" />
															         </div>
				                                                </div>
				                                                
															    <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-5">
																	     <label  class="font-weight-bold font-italic" style="color: #708090" >T�tulo Arquivo</label>
																	     <input style="color: #000000" type="text" name="tituloArquivo" id="tituloArquivo" class="form-control">
																	</div>
				                                                </div>
				                                                
				                                                <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-5">
																	     <label  class="font-weight-bold font-italic" style="color: #708090" >Nome Arquivo</label>
																	     <input style="color: #000000" type="text" name="nomeArquivo" id="nomeArquivo" class="form-control" readonly="readonly">
																	</div>
																	
				 													<div class="form-group form-default form-static-label col-md-5" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Arquivo</label>
																	    <input style="color: #000000" type="text" name="caminhoArquivo" id="caminhoArquivo" class="form-control" readonly="readonly">								     
																	</div>	
																	
																	<div class="form-group form-default form-static-label col-md-2" >
																	    <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >Extens�o</label>
																	    <input style="color: #000000" type="text" name="extensaoArq" id="extensaoArq" class="form-control" readonly="readonly">								     
																	</div>	
				                                                </div>
				                                                
				                                                
																<hr>  
																<br>
																<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btAddProduto" id="btAddProduto" onclick="mudancaEmergencial.salvarArquivo();">Add</button>
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
									
																<div style="height: 150px; overflow: scroll;">
																	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaArquivosMudanca">
																		  <thead>
																		    <tr class="table-primary">
																		      <th scope="col" style="vertical-align: middle;color: white">Nome Arquivo  </th>
																		      <th scope="col" style="vertical-align: middle;color: white">Arquivo        </th>
																		      <th scope="col" style="vertical-align: middle;color: white">Caminho Arquivo</th>
																		      <th scope="col" style="vertical-align: middle;color: white">Extens�o       </th>
																		      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete         </th>
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
                                            </div>

                                            <!-- ##################################################################################### -->
                                            <!--          Etapa Plano de execu��o da Mudan�a                                           -->
                                            <!-- ##################################################################################### -->                                                                                                                            
                                            <div id="step_7" class="step">
                                            
												<div class="card">
												    
												  <h5 class="card-header border-primary">Dados de Identifica��o da Mudan�a</h5>
												  
												  <div class="card-body ">
												       <h5 class="card-title">Info. da Mudan�a</h5><hr>
                                                       <div style="height: 80px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr class="table-primary">
															      <th scope="col" style="vertical-align: middle;color: white">T�tulo da mudan�a       </th>
															      <th scope="col" style="vertical-align: middle;color: white">Login                   </th>
															      <th scope="col" style="vertical-align: middle;color: white">Status                  </th>
															      <th scope="col" style="vertical-align: middle;color: white">Tipo de Mudan�a         </th>
															      <th scope="col" style="vertical-align: middle;color: white">Impacto da Mudan�a      </th>
															      <th scope="col" style="vertical-align: middle;color: white">Urg�ncia da Mudan�a     </th>
															      <th scope="col" style="vertical-align: middle;color: white">Data de Execu��o        </th>
															      <th scope="col" style="vertical-align: middle;color: white">Horario de Inicio       </th>
															      <th scope="col" style="vertical-align: middle;color: white">Data                    </th>
															      <th scope="col" style="vertical-align: middle;color: white">Horario Previsto        </th>
															      <th scope="col" style="vertical-align: middle;color: white">Descri��o da mudan�a    </th>
															      <th scope="col" style="vertical-align: middle;color: white">Justificativa da mudan�a</th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowDadosIdentMudancca">
															  
															  </tbody>
															</table>
													   </div>
													  </div>
												</div>
												<!--  
												     Fim Das atualizacoes do "Dados de Identifica��o da Mudan�a"
												-->
												<div class="card">
												  <h5 class="card-header border-primary">Lista de Aprovadores</h5>
												  <div class="card-body ">
												       <h5 class="card-title">Aprovadores</h5><hr>
                                                                   <div style="height: 150px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr class="table-primary">
															      <th scope="col" style="vertical-align: middle;color: white">ID Aprovador</th>
															      <th scope="col" style="vertical-align: middle;color: white">Aprovador   </th>
															      <th scope="col" style="vertical-align: middle;color: white">E-mail      </th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowAprovadores">
															  
															  </tbody>
															</table>
													   </div>
													  </div>
												</div>
												<!--  
												     Fim Das atualizacoes do "Dados de Identifica��o da Mudan�a"
												-->
												<div class="card">
												  <h5 class="card-header border-primary">Lista dos Arquivo(s) de Aprova��o do(s) Cliente(s)</h5>
												  <div class="card-body ">
												       <h5 class="card-title">Arquivo(s) de Aprova��o</h5><hr>
                                                         <div style="height: 150px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr class="table-primary">
															      <th scope="col" style="vertical-align: middle;color: white">Nome Arquivo  </th>
															      <th scope="col" style="vertical-align: middle;color: white">Arquivo        </th>
															      <th scope="col" style="vertical-align: middle;color: white">Caminho Arquivo</th>
															      <th scope="col" style="vertical-align: middle;color: white">Extens�o       </th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowArquivosAprovCliente">
															  
															  </tbody>
															</table>
													   </div>
													  </div>
												</div>
												<!--  
												     Fim Das atualizacoes do "Aprovadores"
												-->
												<div class="card">
												  <h5 class="card-header border-primary">Plano de Comunica��o</h5>
												  
												  <div class="card-body ">
												       <h5 class="card-title">Clientes Afetados</h5><hr>
                                                       <div style="height: 150px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr class="table-primary">
															      <th scope="col" style="vertical-align: middle;color: white">ID Cliente</th>
															      <th scope="col" style="vertical-align: middle;color: white">Cliente    </th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowClientesAfetados">
															  
															  </tbody>
															</table>
													   </div>
												  </div>
												  
												  <div class="card-body ">
												       <h5 class="card-title">Comunica��o Pessoas</h5><hr>
                                                       <div style="height: 150px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr class="table-primary">
															      <th scope="col" style="vertical-align: middle;color: white">ID Contato  </th>
															      <th scope="col" style="vertical-align: middle;color: white">Nome Contato</th>
															      <th scope="col" style="vertical-align: middle;color: white">Empresa     </th>
															      <th scope="col" style="vertical-align: middle;color: white">E-mail      </th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowPlComunicacaoPessoas">
															  
															  </tbody>
															</table>
													   </div>
												  </div>
												</div>
												  <!--  
												     Fim Das atualizacoes do "Dados de Identifica��o da Mudan�a"
												  -->
												<div class="card">
												  <h5 class="card-header border-primary">Lista de Tarefas</h5>
												  <div class="card-body ">
												       <h5 class="card-title">Tarefas</h5><hr>
                                                                   <div style="height: 150px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr class="table-primary">
															      <th scope="col" style="vertical-align: middle;color: white"                    >T�tulo Tarefa     </th>
															      <th scope="col" style="vertical-align: middle;color: white"                    >Data Tarefa       </th>
															      <th scope="col" style="vertical-align: middle;color: white"                    >Dura��o Tarefa    </th>
															      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Prioridade        </th>
															      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Indisponibilidade </th>
															      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Enviar E-mail     </th>
															      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Tarefa Autom�tica </th>
															      <th scope="col" style="vertical-align: middle;color: white"                    >Descri��o Tarefa  </th>
															      <th scope="col" style="vertical-align: middle;color: white"                    >Respons�vel Tarefa</th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowTarefas">
															  
															  </tbody>
															</table>
													   </div>
													  </div>
												</div>
												<!--  
												     Fim Das atualizacoes do "Aprovadores"
												-->
												<div class="card">
												  <h5 class="card-header border-primary">Informa��es das A��es p�s Atividades</h5>
												  <div class="card-body ">
												       <h5 class="card-title">A��es p�s atividades</h5><hr>
                                                                   <div style="height: 150px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr class="table-primary">
															      <th scope="col" style="vertical-align: middle;color: white">Plano de Testes </th>
															      <th scope="col" style="vertical-align: middle;color: white">Plano de Retorno</th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowacaosPosAtividades">
															  
															  </tbody>
															</table>
													   </div>
													  </div>
												</div>
												
												<!--  
												     Fim Das atualizacoes do "Aprovadores"
												-->
												<div class="card">
												  <h5 class="card-header border-primary">Lista de Arquivos Anexados</h5>
												  <div class="card-body ">
												       <h5 class="card-title">Arquivos</h5><hr>
                                                                   <div style="height: 150px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr class="table-primary">
															      <th scope="col" style="vertical-align: middle;color: white">T�tulo Arquivo</th>
															      <th scope="col" style="vertical-align: middle;color: white">Nome Arquivo  </th>
															      <th scope="col" style="vertical-align: middle;color: white">Arquivo       </th>
															      <th scope="col" style="vertical-align: middle;color: white">Extens�o      </th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowArquivosAnexados">
															  
															  </tbody>
															</table>
													   </div>
													  </div>
												</div>
                                            </div>
                                            
                                     </form>
                                 </div>
                              </div>
                              <br>
                              <br>
                              
							  <div class="row">
								  <div class="col-sm-12">
									  <div class="card">
										  <div class="card-block">
											  <div class="row">
												  <div class="col-lg-6">
												  	<button type="button" class="btn btn-block btn-outline-primary" id="prev">Anterior</button>
												  </div>
												  <div id="divBtProximo" class="col-lg-6">
												  	<button type="button" class="btn btn-block btn-outline-primary" id="next">Pr�ximo</button>
												  </div>
												  <div id="divBtSalvar" class="col-lg-6" style="display:none">
												  	<button type="button" class="btn btn-block btn-outline-success" name="btSalvarGMUDNormal" id="btSalvarGMUDNormal" data-toggle="tooltip" data-placement="top" title="Salvar nova Mudan�a" onclick="desabilitaBotaoSalvar();mudancaEmergencial.salvarGMUDEmergencial();">Salvar Mudan�a</button>
												  </div>

											  </div>
									      </div>
									  </div>
							      </div>
							  </div>
						</div>
                     </div>
                        </div>
                        <div id="styleSelector"> </div>
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
   
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/cadMudancaEmergencialController.js"></script>
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/cadCadEmergencialClass.js"></script>
 
    
</body>

</html>
