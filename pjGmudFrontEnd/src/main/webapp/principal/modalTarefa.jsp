
    
  <div class="modal t-modal primary" id="modalExecucaoTarefaGMUD" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered .modal-sm"  style="max-width: 50% !important;" role="document">

		<div class="modal-content">

			<!-- Modal Header -->
	        <div class="modal-header">
	          <h5 class="modal-title" id="TituloModalGMUD">Manutenção de Tarefas</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        
	        <div class="modal-body">

                 <div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-block">
                                <input type="hidden" id="idTarefaAux" readonly="readonly">
                                <input type="hidden" id="idMudancaAux" readonly="readonly">
							    <div class="form-row">
							    
							        <input type="hidden"  name="UserLogado" id="UserLogado" value="<%=session.getAttribute("usuario")%>">
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
									     <textarea style="color: #000000" class="form-control" id="descricaoTarefa" disabled="disabled" name="descricaoTarefa" placeholder="Observação" rows="10" ></textarea>
									</div>
                                </div>

                                <div class="from-row">
									<div class="form-group form-default form-static-label col-md-12 mb-12">
									     <span class="font-weight-bold font-italic" style="color: #708090">Report Final Tarefa</span>
									     <textarea style="color: #000000" class="form-control" id="reportFinal" disabled="disabled" name="reportFinal" placeholder="Observação" rows="10" ></textarea>
									</div>
                                </div>
                                            
								<hr>  
								<br>
								
								<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" name="btFinalizar" id="btFinalizar" disabled="disabled" onclick="finalizarTarefa();">Finalizar</button>
								<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" style="margin-right: 15px;" name="btAddTarefa" id="btIniciar"   disabled="disabled" onclick="iniciarTarefa( );">Iniciar</button>
								
								<a data-toggle="modal" href="#modalTrasnferenciaTarefa" class="float-right mytooltip tooltip-effect-9 text-success" style="margin-right: 15px;" >
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
								 	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaTarefas" >
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
										<tbody id="tbTarefasModal">
	
										</tbody>
									</table>
								</div>
	
							</div>
						</div>
					</div>
				 </div>
			     

	        </div>
	        
	        
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-success" data-dismiss="modal">Fechar</button>
			</div>
		
		</div>
	</div>
	
    <div id="box_dark" class="box_dark" > 
       <div class="spinner-border text-info box_modal" ></div>
    </div>		
  </div>
  
