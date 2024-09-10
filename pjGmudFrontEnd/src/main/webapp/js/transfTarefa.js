/**
 * 
 */
/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/

async function abrirModalTransfTarefa( urlBase, idMudanca, loginUser ){
	
	await getTarefaPorIdGMUD( urlBase, idMudanca, loginUser );
	$('#modalTrasnferenciaTarefa').modal('toggle');
	
/*	
	$('#modalTrasnferenciaTarefa').on('shown.bs.modal', function () {
		getTarefaPorIdGMUD( urlBase, idMudanca, loginUser )
	})
*/	
}


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
async function funcUpdateResponsavelAtivadeModal( idSelect, idAtividadeMudanca, loginUser ){

 let idResponsavel  = document.getElementById(idSelect).value;
 let nomeResponsavel = $('#'+idSelect).find ( ":selected").text( );
 

 let urlBase = document.getElementById('urlAPI').value;
 let urlAPI  = urlBase + 'mudarResponsavelAtividade/' + idAtividadeMudanca + '/' + idResponsavel + '/' + nomeResponsavel + '/' + loginUser;

 const r_updadeRespons = await fetch( urlAPI, { method : 'POST',
                                                headers: { 'Content-Type': 'application/json; charset=utf-8' }
			                                   }).then(response => response.text())
			                                     .then(body => { return body; });
											 
											 
 let msg = "";
   if( r_updadeRespons === 'sucesso' ){
	getTabelaHistoriico( idAtividadeMudanca );
       msg = "Update Responsável Atividade para " + nomeResponsavel + ", realizado com Sucesso!";
       MensagemConfimacaoModal( "success","Update Responsável Atividade", msg, "modalTrasnferenciaTarefa" );
   }else {
      msg = "ERRO: Update Responsável Atividade para " + nomeResponsavel + "!";
      MensagemConfimacaoModal( "error","Update Responsável Atividade", msg, "modalTrasnferenciaTarefa" );
   } 
   
   hideLoading();    
} 
function tabelaTrasfResponcabilidade(  ){
   var tabelaResposTarefa = document.getElementById( 'tabelaTarefasModalTrocaResponse' ),rIndex;
   for( var i = 0; i < tabelaResposTarefa.rows.length; i++  ){
        tabelaResposTarefa.rows[i].onclick = function(){
           rIndex = this.rowIndex;
    //       console.log( rIndex + ' - ' + this.cells[0].innerHTML + ' - ' + this.cells[2].innerHTML + ' - ' + $('#id_select_'+ (rIndex-1) ).find ( ":selected").text( ) );
		   if( rIndex !== 0 ) getTabelaHistoriico( this.cells[0].innerHTML );
        }
   }
}

 async function getTabelaHistoriico( idTarefa ){
	let urlBase = document.getElementById('urlAPI').value;
	let urlAPI  = urlBase + 'buscarHistoricoTranIdTarefa/' + idTarefa;
	const r_historico = await fetch( urlAPI, { method : 'GET', headers: { 'Content-Type': 'application/json; charset=utf-8' } }).then(response => response.text());
	
	if( r_historico !== null ){
		montaTabelaHistoriico( r_historico )
    }else{
		let tbody = document.getElementById('tbTarefasHistorico');	
		tbody.innerText = '';

	}
	
 }
 
 async function montaTabelaHistoriico( v_historico ){
	
	const l_historico = JSON.parse( v_historico );
	
	let tbody = document.getElementById('tbTarefasHistorico');	
	tbody.innerText = '';
	for(let i = 0; i < l_historico.length; i++){
		let tr = tbody.insertRow();
		
		let td_idTarefa       = tr.insertCell();
		let td_idRespOrgem    = tr.insertCell();
		let td_nomeRespOrigem = tr.insertCell();
		let td_idRespDest     = tr.insertCell();
		let td_nomeRespDest   = tr.insertCell();
		let td_DdataHist      = tr.insertCell();
		let td_login          = tr.insertCell();
		
		let dtAlteracao = '';
		if( l_historico[i].dt_criacao !== null  ){
			let data = l_historico[i].dt_criacao;
			let tam  = data.length;
           
			if( tam === 5 ){
				dtAlteracao = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' + '00';
			}else if( tam === 7 || tam === 6){
					dtAlteracao = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' +data[5];
			}else dtAlteracao = data;
        }
		
		td_idTarefa.innerText       = ( l_historico[i].id_tarefa              !== undefined ? l_historico[i].id_tarefa              : ' - ' );
		td_idRespOrgem.innerText    = ( l_historico[i].id_responsavel_origem  !== undefined ? l_historico[i].id_responsavel_origem  : ' - ' );
		td_nomeRespOrigem.innerText = ( l_historico[i].nome_user_origem       !== undefined ? l_historico[i].nome_user_origem       : ' - ' );
		td_idRespDest.innerText     = ( l_historico[i].id_responsavel_destino !== undefined ? l_historico[i].id_responsavel_destino : ' - ' );
		td_nomeRespDest.innerText   = ( l_historico[i].nome_user_destino      !== undefined ? l_historico[i].nome_user_destino      : ' - ' );
		td_DdataHist.innerText      = ( l_historico[i].dt_criacao             !== undefined ? formatData( 2, dtAlteracao )          : ' - ' );
		td_login.innerText          = ( l_historico[i].login_user             !== undefined ? l_historico[i].login_user             : ' - ' );
		
		
		td_idTarefa.setAttribute      ('style', 'vertical-align: middle; text-align:center' );
		td_idRespOrgem.setAttribute   ('style', 'vertical-align: middle; text-align:center' );
		td_idRespDest.setAttribute    ('style', 'vertical-align: middle; text-align:center' );
		td_nomeRespOrigem.setAttribute('style', 'vertical-align: middle' );
		td_nomeRespDest.setAttribute  ('style', 'vertical-align: middle' );
		td_DdataHist.setAttribute     ('style', 'vertical-align: middle' );
		td_login.setAttribute         ('style', 'vertical-align: middle' );
	}
	
 }

 async function listaTabelaTarefaTRT( tarefas, loginUser ){
	let tbody = document.getElementById('tbTarefasModalTrocaResponse');	
	tbody.innerText = '';
	
	let l_r_Cliente = await getResponsavelTarefa();
	let userLogado = document.getElementById('UserLogado').value;
	
	for(let i = 0; i < tarefas.length; i++){
		
		let tr = tbody.insertRow();

		var idSelect = "id_select_"+i;
		let valorSelect = "";
		        
		if( tarefas[i].dt_inicio_tarefa !== null || userLogado !== loginUser ){
		    const nomeResp   = tarefas[i].responsavelAtividade.responsavel_atividade;			                   
		    const idNomeResp = tarefas[i].responsavelAtividade.id_responsavel_atividade;			
			
		    let   msn        = "";
		    if( userLogado !== loginUser )
		    	msn = 'Somente o Owner da GMUD poderá alterar o executor da tarefa!';
		    else msn = 'Não é possível alterar o responsável desta tarefa, pois já foi iniciada pelo usuário "' + nomeResp + '"!';
			
			valorSelect  ="<td style=\"vertical-align: middle;>";
			valorSelect += " <select class=\"form-control\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"" + msn + "\" id=\"" + idSelect + "\" >";
			valorSelect += "<option value=" + idNomeResp + " selected disabled>" + nomeResp + "</option>"; 
			valorSelect += " </select>  </td>";
		}else{
			valorSelect  = "<td style=\"vertical-align: middle;\"> ";
		    valorSelect += " <select  class=\"form-control\" id=\"" + idSelect + "\" onchange=\"funcUpdateResponsavelAtivadeModal('" + idSelect + "', "  + tarefas[i].id_atividade_mudanca + ", '" + loginUser + "', 'modalTrasnferenciaTarefa' )\">";
		    for(let j = 0; j < l_r_Cliente.length; j++){
		        if( tarefas[i].responsavelAtividade.id_responsavel_atividade === l_r_Cliente[j].id_responsavel_atividade ) selected = " selected ";
		        else selected = "";	
		        valorSelect += "<option value=" + l_r_Cliente[j].id_responsavel_atividade + " " + selected + ">" + l_r_Cliente[j].responsavel_atividade + "</option>"; 
		    }
		    valorSelect += " </select> </td>";	
		}			

		let td_idTarefa                  = tr.insertCell();
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
			dtInicioTarefa = await formatDataStr( tarefas[i].dt_inicio_tarefa );
		if( tarefas[i].dt_final_tarefa !== null  )
			dtFinalTarefa = await formatDataStr( tarefas[i].dt_final_tarefa );
		        
        // Inseri os valores do objeto nas celulas
		td_idTarefa.innerText                  = ( tarefas[i].id_atividade_mudanca                       !== undefined ? tarefas[i].id_atividade_mudanca                       : -1 );
        td_tituloTarefaShow.innerText          = ( tarefas[i].titulo_atividade_mudanca                   !== undefined ? tarefas[i].titulo_atividade_mudanca                   : '' );
        td_dataTarefaShow.innerText            = ( tarefas[i].dt_tarefa                                  !== undefined ? formatData( 1, tarefas[i].dt_tarefa )                 : '' );
		td_duracaoTarefaShow.innerText         = ( duracaoFort                                           == ' - '      ? duracaoFort                                           : duracaoFort    );
		td_prioridadefa.innerText              = ( tarefas[i].prioridade                                 !== undefined ? tarefas[i].prioridade                                 : ''             );
		td_descricaoTarefaShow.innerText       = ( tarefas[i].atividade_mudanca                          !== undefined ? tarefas[i].atividade_mudanca                          : ''             );
//		td_nomeResponsavelTarefaShow.innerText = ( tarefas[i].responsavelAtividade.responsavel_atividade !== undefined ? tarefas[i].responsavelAtividade.responsavel_atividade : ''             );
		td_dataInicioTarefaShow.innerText      = ( dtInicioTarefa                                        !== ' - ' ? formatData( 2, dtInicioTarefa )                           : dtInicioTarefa );
		td_dataFimTarefaShow.innerText         = ( dtFinalTarefa                                         !== ' - ' ? formatData( 2, dtFinalTarefa  )                           : dtFinalTarefa  );
		td_nomeResponsavelTarefaShow.outerHTML = valorSelect; // Selecte de Responsavel pela Tarefa, caso seja necess'ario alterar.

       
        if( tarefas[i].dt_inicio_tarefa === null ) td_dataInicioTarefaShow.classList.add('center');
        if( tarefas[i].dt_final_tarefa  === null ) td_dataFimTarefaShow.classList.add('center');

		td_tituloTarefaShow.setAttribute         ('style', 'vertical-align: middle' );
		td_dataTarefaShow.setAttribute           ('style', 'vertical-align: middle' );
		td_prioridadefa.setAttribute             ('style', 'vertical-align: middle; text-align:center' );
		td_duracaoTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
		td_descricaoTarefaShow.setAttribute      ('style', 'vertical-align: middle' );
		td_nomeResponsavelTarefaShow.setAttribute('style', 'vertical-align: middle; text-align:center' );
		td_dataInicioTarefaShow.setAttribute     ('style', 'vertical-align: middle' );
		td_dataFimTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
		
		td_idTarefa.setAttribute        ('style', 'display:none' );
    }
	
	
	tabelaTrasfResponcabilidade();
	
}

async function getTarefaPorIdGMUD( urlBase, idMudanca, loginUser ){
		
	let urlAPI = urlBase + "obterListaAtividadeMudanca/" + idMudanca;

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
			    MensagemConfimacaoModal( "warning", "Executa Tarefa", response.error, "modalTrasnferenciaTarefa" );
		    }else{				
				listaTabelaTarefaTRT( response, loginUser );
		    }
			hideLoading();
		}
		
	}).fail(function(xhr, status, errorThrown) {
		// alert("Erro ao Listar Mudanças: " + xhr.responseText);
		hideLoading();
		MensagemConfimacaoModal( "error", "Tarefas", "Erro ao Listar Mudanças po ID: " + xhr.responseText, "modalTrasnferenciaTarefa" ) ;
	});
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

async function formatDataStr( data ) {
let tam    = data.length;
let dtFort;
   
if( tam === 5 ){
	dtFort = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' + '00';
}	else if( tam === 7 ){
		dtFort = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' +data[5];
}else dtFort = data;

return dtFort;

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

	function MensagemConfimacaoModal( iconi, tituloPrincipal, textoPrincipal, nomeModal ) {
	// icon
	//  	"warning"
	//  	"error"
	//  	"success"
	//  	"info"

		  Swal.fire({
			    icon  : iconi                             ,
			    title : tituloPrincipal                   ,
			    text  : textoPrincipal                    ,
			    target: document.getElementById(nomeModal),
			    }
			);
		
	}
