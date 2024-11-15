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
										  	<h5 class="m-b-1">Portal de GMUD - Cadastro de Mudan�a Padr�o</h5>
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
								    <h3 class="text-muted">Cadastro de Mudan�a Padr�o - Passo <samp id="passo"></samp></h3>
								    <br>
                                    <form class="form-material" method="post" id="formManutMudancaPadrao">
                                       <div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-block">
			                                            <div class="form-row">
				                                            <!-- Email do uduario de abertura -->
				                                            <input type="hidden"  name="emailSolicitante" id="emailSolicitante" value="<%=session.getAttribute("emailSolicitante")%>">

				                                            <!-- URL da base da API Base TST ou PRD  -->
				                                            <input type="hidden"  name="urlAPI" id="urlAPI" value="<%=session.getAttribute("urlAPI")%>">

															<div class="form-group form-default form-static-label col-md-1 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >ID</span>
															     <input style="color: #000000" type="text" name="idCategoriaPadrao" id="idCategoriaPadrao" readonly="readonly" class="form-control" >
															</div>

															<div class="form-group form-default form-static-label col-md-2 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >Data Cadastro</span>
															     <input style="color: #000000" type="text" name="dtCadastro" id="dtCadastro" readonly="readonly" class="form-control" >
															</div>

															<div class="form-group form-default form-static-label col-md-6 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >Categoria Padr�o</span>
															     <input style="color: #000000" type="text" name="categoriaPadrao" id="categoriaPadrao" class="form-control" placeholder="Categoria Padr�o" value="">
															</div>

															 
															<div class="form-group form-default form-static-label col-md-2 mb-6">
															     <span  class="font-weight-bold font-italic" style="color: #708090" >Login</span>
															     <input style="color: #000000" type="text" name="login" id="login" readonly="readonly" class="form-control" >
															</div>
													    </div>
														<hr>  
														<br>

														<div class="form-row">
															<div class="form-group form-default form-static-label col-md-12 mb-12">
															     <span class="font-weight-bold font-italic" style="color: #708090">observa��o</span>
															     <textarea style="color: #000000" class="form-control" id="Obs" name="Obs" placeholder="Observa��o" rows="100" ></textarea>
															</div>
														</div>
														
														<hr>  
												        <br>
														<div class="form-row">
															<div class="form-group form-default form-static-label col-md-12 mb-12">
												        <button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btSalvarCatPadrao" id="btSalvarCatPadrao" onclick="salvarCatPadrao( );">Atualizar Categoria</button>																		 
															</div>
														</div>
										                
										                <div class="card">
										                     <h5 class="card-header border-primary">Dados de Identifica��o das Tarefas que Ser�o Criadas Automaticamente</h5>
										                     <div class="card-body ">
										                     
															     <div class="form-row">

																    <div class="form-group form-default form-static-label col-md-3 mb-6" >
																       <label class="font-weight-bold font-italic" id="lbperiodoUtilizacaoMAR" >ID</label>
																       <input style="color: #000000" type="text" name="idItemCategoriaPadrao" id="idItemCategoriaPadrao" readonly="readonly" class="form-control">								     
																    </div>
															     															     
																    <div class="form-group form-default form-static-label col-md-3 mb-6" >
																       <label class="font-weight-bold font-italic">T�tulo Tarefa</label>
																       <input style="color: #000000" type="text" name="tituloCatPadrao" id="tituloCatPadrao" class="form-control">								     
																    </div>
																    
																    <div class="form-group form-default form-static-label col-md-3 mb-6" >
																       <label class="font-weight-bold font-italic">Dura��o Tarefa</label>
																       <input style="color: #000000" type="number" min="1" name="duracao" id="duracao" class="form-control" onclick="iniciarTimeDuracao()">					     
																    </div>
																    
																    <div class="form-group form-default form-static-label col-md-3 mb-6" >
																       <label class="font-weight-bold font-italic">Prioridade</label>
																       <input style="color: #000000" type="number" min="1" max="50" name="prioridade" id="prioridade" class="form-control">								     
																    </div>
																    
																    
																    <div class="form-group form-default form-static-label col-md-2 mb-1">
																	     <div class="form-check form-check-inline">
																		   <input class="form-check-input" type="checkbox" id="checkBoxIndisp" value="option1">
																		   <label class="form-check-label" for="checkBoxIndisp">Indisponibilidade</label>
																		 </div>
																    </div>
																    
																    
																    
															     </div>
																 <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-12 mb-12">
																	     <span class="font-weight-bold font-italic">Descri��o Tarefa</span>
																	     <textarea style="color: #000000" class="form-control" id="descCatPadrao" name="ObdescCatPadraos" placeholder="Observa��o" rows="100" ></textarea>
																	</div>
																 </div>
																 
																 <hr>  
														         <br>
														         <button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btSalvarItem" id="btSalvarItem" onclick="salvarItemCatPadrao( );">Atualizar Item</button>																		 
														         <button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="border-radius: 25px;" name="btSalvarItem" id="btSalvarItem" onclick="limparItemCatPadraoNovoItem( );">Limpar</button>																		 

														    </div>
															     
														    <hr>  
														    <br>

			 												<!-- Tabela com as informacoes do Recursos a serem cadastrasdos -->                       
															<div class="row">
																<div class="col-sm-12">
																	<!-- Basic Form Inputs card start -->
																	<div class="card">
																		<div class="card-block">
												
																			<div style="height: 300px; overflow: scroll;">
																				<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelatemCatPadrao">
																					  <thead>
																					    <tr class="table-primary">
																					      <th scope="col" style="vertical-align: middle;color: white"                    >T�tulo tarefa       </th>
																					      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Dura��o tarefa(Min.)</th>
																					      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Prioridade tarefa   </th>
																					      <th scope="col" style="vertical-align: middle;color: white"                    >Descri��o tarefa    </th>
																					      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Editar              </th>
																					      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete              </th>
																					    </tr>
																					  </thead>
																					<tbody id="tbItemCatPadrao">
												
																					</tbody>
																				</table>
																			</div>
												
																		</div>
																	</div>
																</div>
															</div>
															
														</div>

														 <div class="card">
										                    <h5 class="card-header border-primary">Lista de Categoria Padr�o Cadastradas</h5>
			 												<!-- Tabela com as informacoes do Recursos a serem cadastrasdos -->                       
															<div class="row">
																<div class="col-sm-12">
																	<!-- Basic Form Inputs card start -->
																	<div class="card">
																		<div class="card-block">
												
																			<div style="height: 300px; overflow: scroll;">
																				<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaCatPadraoCad">
																					  <thead>
																					    <tr class="table-primary">
																					      <th scope="col" style="text-align: center; vertical-align: middle;color: white">ID              </th>
																					      <th scope="col" style="vertical-align: middle;color: white"                    >Data Cria��o    </th>
																					      <th scope="col" style="vertical-align: middle;color: white"                    >Login           </th>
																					      <th scope="col" style="vertical-align: middle;color: white"                    >Categoria Padr�o</th>
																					      <th scope="col" style="vertical-align: middle;color: white"                    >Observa��o      </th>
																					      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Editar          </th>
																					      <th scope="col" style="text-align: center; vertical-align: middle;color: white">Delete          </th>
																					    </tr>
																					  </thead>
																					<tbody id="tbodyCatPadraoCad">
												
																					</tbody>
																				</table>
																			</div>
												                            
												                            <nav id="navegacaoPag" aria-label="Navega��o de p�gina">
												                            </nav>
																		</div>
																	</div>
																</div>
															</div>
														</div>

										            </div>
										        </div>
										    </div>
										 </div>

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
  

  <div id="box_dark" class="box_dark" > 
     <div class="spinner-border text-info box_modal" ></div>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
  <jsp:include page="/util/javascriptfile.jsp"></jsp:include>
   
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/manutCategoriaPadraoController.js"></script> 
    
</body>

</html>
