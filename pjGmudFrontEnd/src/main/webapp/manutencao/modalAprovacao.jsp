  <div class="modal t-modal primary" id="modalDetalheGMUD" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered .modal-sm"  style="max-width: 50% !important;" role="document">
		<div class="modal-content">

			<!-- Modal Header -->
	        <div class="modal-header">
	          <h5 class="modal-title" id="TituloModalGMUD">Detalhe da Mudança</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        
	        <div class="modal-body">

				  <div id="divInfoGMUD" class="card">
				     <h5 class="card-header border-primary">Dados de Identificação da Mudança</h5>
				     <div class="card-body ">
				         <h5 class="card-title">Info. da Mudança</h5><hr>
                         <div style="height: 80px; overflow: scroll;">
							<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
							  <thead >
							    <tr >
							      <th class="font-weight-bold font-italic " style="color: #708090">Título da mudança       </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Status                  </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Tipo de Mudança         </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Impacto da Mudança      </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Urgência da Mudança     </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Data de Execução        </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Horario de Inicio       </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Data                    </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Horario Previsto        </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Descrição da mudança    </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Justificativa da mudança</th>
							    </tr>
							  </thead>
							  <tbody id="TbodyShowDadosIdentMudancca">
							  
							  </tbody>
							</table>
					     </div>
					 </div>
				  </div>
				  <!--  
				     Fim Das atualizacoes do "Dados de Identificação da Mudança"
				  -->
				  <div id="divAprovadores" class="card">
				     <h5 class="card-header border-primary">Lista de Aprovadores</h5>
				     <div class="card-body ">
				         <h5 class="card-title">Aprovadores</h5><hr>
                         <div style="height: 150px; overflow: scroll;">
							<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
							  <thead >
							    <tr >
							      <th class="font-weight-bold font-italic " style="color: #708090">ID Aprovador</th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Aprovador   </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">E-mail      </th>
							    </tr>
							  </thead>
							  <tbody id="TbodyShowAprovadores">
							  
							  </tbody>
							</table>
					     </div>
					 </div>
				  </div>
				<!--  
				     Fim Das atualizacoes do "Dados de Identificação da Mudança"
				-->
				<div id="divArqAprovacao" class="card">
				  <h5 class="card-header border-primary">Lista dos Arquivo(s) de Aprovação do(s) Cliente(s)</h5>
				  <div class="card-body ">
				       <h5 class="card-title">Arquivo(s) de Aprovação</h5><hr>
                                                           <div style="height: 150px; overflow: scroll;">
							<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
							  <thead >
							    <tr >
							      <th scope="col">Nome Arquivo  </th>
							      <th scope="col">Arquivo        </th>
							      <th scope="col">Extensão       </th>
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
				<div id="divClientesAfetados" class="card">
				  <h5 class="card-header border-primary">Info. dos Clientes Afetados</h5>
				  <div  class="card-body ">
				       <h5 class="card-title">Clientes Afetados</h5><hr>
                                               <div style="height: 150px; overflow: scroll;">
							<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
							  <thead >
							    <tr >
							      <th class="font-weight-bold font-italic " style="color: #708090">ID Cliente</th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Cliente    </th>
							    </tr>
							  </thead>
							  <tbody id="TbodyShowClientesAfetados">
							  
							  </tbody>
							</table>
					   </div>
				  </div>
			    </div> 
			     
				<!--  
				     Fim Das atualizacoes do "Aprovadores"
				-->
				<div id="divPlComunicacao" class="card">
				  <h5 class="card-header border-primary">Info. Plano de Comunicação</h5>
			      <div  class="card-body ">
			         <h5 class="card-title">Plano de Comunicação</h5><hr>
                     <div style="height: 150px; overflow: scroll;">
						<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
						  <thead >
						    <tr >
						      <th class="font-weight-bold font-italic " style="color: #708090">ID Contato  </th>
						      <th class="font-weight-bold font-italic " style="color: #708090">Nome Contato</th>
						      <th class="font-weight-bold font-italic " style="color: #708090">Empresa     </th>
						      <th class="font-weight-bold font-italic " style="color: #708090">E-mail      </th>
						    </tr>
						  </thead>
						  <tbody id="TbodyShowPlComunicacao">
						  
						  </tbody>
						</table>
				    </div>
			      </div>
			    </div>  
				<!--  
				     Fim Das atualizacoes do "Dados de Identificação da Mudança"
				-->
				<div id="divTarefas" class="card">
				  <h5 class="card-header border-primary">Lista de Tarefas</h5>
				  <div class="card-body ">
				       <h5 class="card-title">Tarefas</h5><hr>
                       <div style="height: 150px; overflow: scroll;">
							<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
							  <thead >
							    <tr >
							      <th class="font-weight-bold font-italic " style="color: #708090">Título Tarefa     </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Data Tarefa       </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Duração Tarefa    </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Descrição Tarefa  </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Responsável Tarefa</th>
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
				<div id="divAcoesPosAtividades" class="card">
				  <h5 class="card-header border-primary">Informações das Ações pós Atividades</h5>
				  <div class="card-body ">
				       <h5 class="card-title">Ações pós atividades</h5><hr>
			                                                        <div style="height: 150px; overflow: scroll;">
							<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
							  <thead >
							    <tr >
							      <th class="font-weight-bold font-italic " style="color: #708090">Plano de Testes </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Plano de Retorno</th>
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
				<div id="divArqGmud" class="card">
				  <h5 class="card-header border-primary">Lista de Arquivos Anexados</h5>
				  <div class="card-body ">
				       <h5 class="card-title">Arquivos</h5><hr>
                       <div style="height: 150px; overflow: scroll;">
							<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
							  <thead >
							    <tr >
							      <th class="font-weight-bold font-italic " style="color: #708090">Título Arquivo</th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Nome Arquivo  </th>
							      <th class="font-weight-bold font-italic " style="color: #708090">Extensão      </th>
							    </tr>
							  </thead>
							  <tbody id="TbodyShowArquivosAnexados">
							  
							  </tbody>
							</table>
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
  </div>
  
