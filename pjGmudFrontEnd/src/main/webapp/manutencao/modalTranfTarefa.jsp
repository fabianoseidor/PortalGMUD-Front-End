<!--Modal 
-->
<div class="modal t-modal primary" id="modalTrasnferenciaTarefa" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true" data-backdrop="static">
   <div class="modal-dialog modal-dialog-centered .modal-sm"  style="max-width: 50% !important;" role="document">

		<div class="modal-content">

			<!-- Modal Header -->
	        <div class="modal-header">
	          <h5 class="modal-title" id="TituloModalGMUD">Alterar Responsabilidade de Tarefa</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        
	        <div class="modal-body">

                 <div class="pcoded-inner-content">
                    <div class="main-body">
                       <div class="page-wrapper">
                          <div class="page-body">
                             <div class="row">
                                <div class="col-sm-12">
                                 
                                   <div class="row">
                                      <div class="col-sm-12">
                                         <div class="card">
                                            <div class="card-block">
                                               <h5 class="card-header border-primary" id="infoTitutoTarefas">Lista de Tarefas</h5><hr><br>
                                               <div class="row">
                                                  <div class="col-sm-12">
                                                     <div class="card">
                                                        <div class="card-block">
                                                           <div style="height: 200px; overflow: scroll;">
                                                              <table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaTarefasModalTrocaResponse" >
                                                                 <thead>
                                                                    <tr class="table-primary">
                                                                       <th scope="col" style="vertical-align: middle;color: white">Título Tarefa     </th>
                                                                       <th scope="col" style="vertical-align: middle;color: white">Data Tarefa       </th>
                                                                       <th scope="col" style="vertical-align: middle;color: white">Duração Tarefa    </th>
                                                                       <th scope="col" style="text-align: center; vertical-align: middle;color: white">Prioridade        </th>
                                                                       <th scope="col" style="vertical-align: middle;color: white">Descrição Tarefa  </th>
                                                                       <th scope="col" style="vertical-align: middle;color: white">Responsável Tarefa</th>
                                                                       <th scope="col" style="vertical-align: middle;color: white">Data Início       </th>
                                                                       <th scope="col" style="vertical-align: middle;color: white">Data Final        </th>
                                                                    </tr>
                                                                 </thead>
                                                                 <tbody id="tbTarefasModalTrocaResponse">
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

                                    <div class="row">
                                      <div class="col-sm-12">
                                         <div class="card">
                                            <div class="card-block">
                                               <h5 class="card-header border-primary" id="infoTitutoTarefas">Histórico de Transferência</h5><hr><br>
                                               <div class="row">
                                                  <div class="col-sm-12">
                                                     <div class="card">
                                                        <div class="card-block">
                                                           <div style="height: 200px; overflow: scroll;">
                                                              <table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaHistorico" >
                                                                 <thead>
                                                                    <tr class="table-primary">
                                                                       <th scope="col" style="text-align: center; vertical-align: middle;color: white">ID Tarefa             </th>
                                                                       <th scope="col" style="text-align: center; vertical-align: middle;color: white">ID Responsável Origem </th>
                                                                       <th scope="col" style="vertical-align: middle;color: white"                    >Nome Resp. Origem     </th>
                                                                       <th scope="col" style="text-align: center; vertical-align: middle;color: white">ID Responsável Destino</th>
                                                                       <th scope="col" style="vertical-align: middle;color: white"                    >Nome Resp. Destino    </th>
                                                                       <th scope="col" style="vertical-align: middle;color: white"                    >Data Transferência    </th>
                                                                       <th scope="col" style="vertical-align: middle;color: white"                    >Login                 </th>
                                                                    </tr>
                                                                 </thead>
                                                                 <tbody id="tbTarefasHistorico">
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
  

 