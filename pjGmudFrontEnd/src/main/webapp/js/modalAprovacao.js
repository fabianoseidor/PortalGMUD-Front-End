/**
 * 
 */

function mostraDivModal(){
	$("#divInfoGMUD"          ).css('display','flex');
	$("#divAprovadores"       ).css('display','flex');
	$("#divArqAprovacao"      ).css('display','flex');
	$("#divClientesAfetados"  ).css('display','flex');
	$("#divPlComunicacao"     ).css('display','flex');
	$("#divTarefas"           ).css('display','flex');
	$("#divAcoesPosAtividades").css('display','flex');
	$("#divArqGmud"           ).css('display','flex');
}

function escondeaDivModal( tipoGMUD ){
	
    if( tipoGMUD === 'NORMAL' ){
		$("#divArqAprovacao").css('display','none');
	}else
	   if( tipoGMUD === 'PADRÃO' ){
		   $("#divArqAprovacao"      ).css('display','none');
		   $("#divAprovadores"       ).css('display','none');
		   $("#divAcoesPosAtividades").css('display','none');
		   $("#divPlComunicacao"     ).css('display','none');
	   } 
}

function getGMUDTituloPorId( urlAPI ){

	$.ajax({
		method     : "GET"                             ,
		url        : urlAPI                            ,
		contentType: "application/json; charset=utf-8" ,
		beforeSend: function( xhr ) {
		   showLoading();
		   mostraDivModal();
		},
		success    : function(response) {
			// console.log( "length: " + response.length );
			
			if( response.error !== undefined ){
			    MensagemConfimacao( "warning", "Pesquisa GMUD", response.error );
		    }else{				
				if( response.tipoMudanca.id_tipo_mudanca === 1 ){
					escondeaDivModal( response.tipoMudanca.tipo_mudanca );
					showTelaNormal( response );
				}else if( response.tipoMudanca.id_tipo_mudanca === 2 ){
					      escondeaDivModal( response.tipoMudanca.tipo_mudanca );
						  showTelaEmerGencial( response );
				 }else if( response.tipoMudanca.id_tipo_mudanca === 3 ){
					       escondeaDivModal( response.tipoMudanca.tipo_mudanca );
						   showTelaPadrao( response );
				       }
		    }
			hideLoading();
			$("#modalDetalheGMUD").modal();
		}
	}).fail(function(xhr, status, errorThrown) {
		// alert("Erro ao Listar Mudanças: " + xhr.responseText);
		hideLoading();
		MensagemConfimacao( "error", "Tarefas", "Erro ao Listar Mudanças po ID: " + xhr.responseText ) ;
	});		
}

function showTelaNormal( gmud ){
	montaResumoDadosIdentMudancca  ( gmud );	
	montaAprovadores               ( gmud );
	montaResumoClientesAfetados    ( gmud );
	montaResumoPlanoComunicacao    ( gmud );
	montaResumoTarefas             ( gmud );
	montaResumoAcaosPosAtividades  ( gmud );	
	montaResumoArquivosAnexados    ( gmud );
}

function showTelaEmerGencial( gmud ){
	montaResumoDadosIdentMudancca  ( gmud );	
	montaAprovadores               ( gmud );
	montaResumoArquivosAprovCliente( gmud );
	montaResumoClientesAfetados    ( gmud );
	montaResumoPlanoComunicacao    ( gmud );
	montaResumoTarefas             ( gmud );
	montaResumoAcaosPosAtividades  ( gmud );	
	montaResumoArquivosAnexados    ( gmud );
}

function showTelaPadrao( gmud ){
	montaResumoDadosIdentMudancca  ( gmud );
	montaResumoClientesAfetados    ( gmud );
	montaResumoTarefas             ( gmud );
	montaResumoArquivosAnexados    ( gmud );
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

function montaResumoDadosIdentMudancca( gmud ){
	
	// Atualiza modal titulo
	document.getElementById("TituloModalGMUD").innerHTML = "Detalhe da Mudança ( ID - " + gmud.id_mudanca + " )";
	
	let tbody = document.getElementById('TbodyShowDadosIdentMudancca');
	tbody.innerText = '';
    let tr = tbody.insertRow();
    
    // Crias as celulas
    let td_tituloMudanca            = tr.insertCell();
	let td_statusMudanca            = tr.insertCell();
	let td_tipoMudanca              = tr.insertCell();
	let td_impactoMudanca           = tr.insertCell();
    let td_urgenciaMudanca          = tr.insertCell();
    let td_dataExecucao             = tr.insertCell();
    let td_horarioInicio            = tr.insertCell();
    let td_dataPrevistaConclusao    = tr.insertCell();
    let td_HorarioPrevistoConclusao = tr.insertCell();
    let td_descricaoMudanca         = tr.insertCell();
    let td_justificativaMudanca     = tr.insertCell();
	

    // Inseri os valores do objeto nas celulas
    td_tituloMudanca.innerText            = ( gmud.titulo_mudanca                     !== undefined ? gmud.titulo_mudanca                              : '' );
    td_statusMudanca.innerText            = ( gmud.statusMudanca                      !== undefined ? formatstatusGmud(gmud.statusMudanca)             : '' );
    td_tipoMudanca.innerText              = ( gmud.tipoMudanca.tipo_mudanca           !== undefined ? gmud.tipoMudanca.tipo_mudanca                    : '' );
    td_impactoMudanca.innerText           = ( gmud.impactoMudanca.impacto_mudanca     !== undefined ? gmud.impactoMudanca.impacto_mudanca              : '' );
    td_urgenciaMudanca.innerText          = ( gmud.criticidade.criticidade            !== undefined ? gmud.criticidade.criticidade                     : '' );
    td_dataExecucao.innerText             = ( gmud.dadosMudanca.dt_inicio             !== undefined ? FormataStringData( gmud.dadosMudanca.dt_inicio ) : '' );
    td_horarioInicio.innerText            = ( gmud.dadosMudanca.hr_inicio             !== undefined ? gmud.dadosMudanca.hr_inicio                      : '' );
    td_dataPrevistaConclusao.innerText    = ( gmud.dadosMudanca.dt_final              !== undefined ? FormataStringData( gmud.dadosMudanca.dt_final )  : '' );
    td_HorarioPrevistoConclusao.innerText = ( gmud.dadosMudanca.hr_final              !== undefined ? gmud.dadosMudanca.hr_final                       : '' );
    td_descricaoMudanca.innerText         = ( gmud.dadosMudanca.dsc_mudanca           !== undefined ? gmud.dadosMudanca.dsc_mudanca                    : '' );
    td_justificativaMudanca.innerText     = ( gmud.dadosMudanca.justificativa_mudanca !== undefined ? gmud.dadosMudanca.justificativa_mudanca          : '' );
}

function montaAprovadores( gmud ){
	let tbody = document.getElementById('TbodyShowAprovadores');
	tbody.innerText = '';
	
	for(let i = 0; i < gmud.listaAprovadores.length; i++){
		// Cria as linhas
        let tr = tbody.insertRow();
        
        // Crias as celulas
        let td_idAprovadores  = tr.insertCell();
        let td_nomeAprovador  = tr.insertCell();
        let td_emailAprovador = tr.insertCell();

        // Inseri os valores do objeto nas celulas
        td_idAprovadores.innerText  = ( gmud.listaAprovadores[i].aprovadores.idAprovadores !== undefined ? gmud.listaAprovadores[i].aprovadores.idAprovadores  : '' );
        td_nomeAprovador.innerText  = ( gmud.listaAprovadores[i].aprovadores.aprovador     !== undefined ? gmud.listaAprovadores[i].aprovadores.aprovador      : '' );
        td_emailAprovador.innerText = ( gmud.listaAprovadores[i].aprovadores.email         !== undefined ? gmud.listaAprovadores[i].aprovadores.email          : '' );
	}
}

function montaResumoArquivosAprovCliente( gmud ){
	let tbody = document.getElementById('TbodyShowArquivosAprovCliente');
	tbody.innerText = '';
	for(let i = 0; i < gmud.arqAprovacaoCliente.length; i++){
		// Cria as linhas
        let tr = tbody.insertRow();
        
        // Crias as celulas
        let td_tituloArquivo  = tr.insertCell();
        let td_nomeArquivo    = tr.insertCell();
        let td_extensaoArq    = tr.insertCell();

        // Inseri os valores do objeto nas celulas
        td_tituloArquivo.innerText  = ( gmud.arqAprovacaoCliente[i].titulo_arquivo !== undefined ? gmud.arqAprovacaoCliente[i].titulo_arquivo : '' );
        td_nomeArquivo.innerText    = ( gmud.arqAprovacaoCliente[i].nome_arq       !== undefined ? gmud.arqAprovacaoCliente[i].nome_arq       : '' );
        td_extensaoArq.innerText    = ( gmud.arqAprovacaoCliente[i].tipo_Arq       !== undefined ? gmud.arqAprovacaoCliente[i].tipo_Arq       : '' );
	}
}

function montaResumoClientesAfetados( gmud ){
	let tbody = document.getElementById('TbodyShowClientesAfetados');
	tbody.innerText = '';
	for(let i = 0; i < gmud.mudancaClientesAfetados.length; i++){
		// Cria as linhas
	    let tr = tbody.insertRow();
	    // Crias as celulas
	    let td_idClienteAfet = tr.insertCell();
	    let td_clienteAfet   = tr.insertCell();

	    // Inseri os valores do objeto nas celulas
	    td_idClienteAfet.innerText = ( gmud.mudancaClientesAfetados[i].clientesAfetados.id_clientes_af !== undefined ? gmud.mudancaClientesAfetados[i].clientesAfetados.id_clientes_af : '' );
	    td_clienteAfet.innerText   = ( gmud.mudancaClientesAfetados[i].clientesAfetados.nome_cliente   !== undefined ? gmud.mudancaClientesAfetados[i].clientesAfetados.nome_cliente   : '' );
	}
}

function montaResumoPlanoComunicacao( gmud ){
	
	let tbody1 = document.getElementById('TbodyShowPlComunicacao');
	tbody1.innerText = '';
	for(let i = 0; i < gmud.planoComunicacoes.length; i++){
		// Cria as linhas
        let tr = tbody1.insertRow();
        // Crias as celulas
        let td_pcIdContato   = tr.insertCell();
        let td_pcNomeContato = tr.insertCell();
        let td_pcEmpresa     = tr.insertCell();
        let td_pcEmail       = tr.insertCell();

        // Inseri os valores do objeto nas celulas
        td_pcIdContato.innerText   = ( gmud.planoComunicacoes[i].id_plano_comunicacao !== undefined ? gmud.planoComunicacoes[i].id_plano_comunicacao : '' );
        td_pcNomeContato.innerText = ( gmud.planoComunicacoes[i].nome_contato         !== undefined ? gmud.planoComunicacoes[i].nome_contato         : '' );
        td_pcEmpresa.innerText     = ( gmud.planoComunicacoes[i].empresa              !== undefined ? gmud.planoComunicacoes[i].empresa              : '' );
        td_pcEmail.innerText       = ( gmud.planoComunicacoes[i].email                !== undefined ? gmud.planoComunicacoes[i].email                : '' );
	}		
}

function montaResumoTarefas( gmud ){
	let tbody = document.getElementById('TbodyShowTarefas');
	tbody.innerText = '';
	for(let i = 0; i < gmud.atividadesMudanca.length; i++){
		// Cria as linhas
        let tr = tbody.insertRow();
        
        // Crias as celulas
        let td_tituloTarefa    = tr.insertCell();
        let td_dataTarefa      = tr.insertCell();
        let td_duracaoTarefa   = tr.insertCell();
        let td_descricaoTarefa = tr.insertCell();
        let td_nomeResponsavel = tr.insertCell();

        // Inseri os valores do objeto nas celulas
        td_tituloTarefa.innerText    = ( gmud.atividadesMudanca[i].titulo_atividade_mudanca                   !== undefined ? gmud.atividadesMudanca[i].titulo_atividade_mudanca                   : '' );
        td_dataTarefa.innerText      = ( gmud.atividadesMudanca[i].dt_tarefa                                  !== undefined ? FormataStringData( gmud.atividadesMudanca[i].dt_tarefa)              : '' );
        td_duracaoTarefa.innerText   = ( gmud.atividadesMudanca[i].duracao                                    !== undefined ? gmud.atividadesMudanca[i].duracao                                    : '' );
        td_descricaoTarefa.innerText = ( gmud.atividadesMudanca[i].atividade_mudanca                          !== undefined ? gmud.atividadesMudanca[i].atividade_mudanca                          : '' );
        td_nomeResponsavel.innerText = ( gmud.atividadesMudanca[i].responsavelAtividade.responsavel_atividade !== undefined ? gmud.atividadesMudanca[i].responsavelAtividade.responsavel_atividade : '' );
	}
}

function montaResumoAcaosPosAtividades( gmud ){
	let tbody = document.getElementById('TbodyShowacaosPosAtividades');
	tbody.innerText = '';
    let tr = tbody.insertRow();
    
    // Crias as celulas
    let td_planoTestes  = tr.insertCell();
    let td_planoRetorno = tr.insertCell();

    // Inseri os valores do objeto nas celulas
    td_planoTestes.innerText  = ( gmud.acaoPosAtividade.plano_teste    !== undefined ? gmud.acaoPosAtividade.plano_teste    : '' );
    td_planoRetorno.innerText = ( gmud.acaoPosAtividade.plano_rollback !== undefined ? gmud.acaoPosAtividade.plano_rollback : '' );
}

function montaResumoArquivosAnexados( gmud ){
	let tbody = document.getElementById('TbodyShowArquivosAnexados');
	tbody.innerText = '';
	for(let i = 0; i < gmud.arquivosMudanca.length; i++){
		// Cria as linhas
        let tr = tbody.insertRow();
        
        // Crias as celulas
        let td_tituloArquivo  = tr.insertCell();
        let td_nomeArquivo    = tr.insertCell();
        let td_extensaoArq    = tr.insertCell();

        // Inseri os valores do objeto nas celulas
        td_tituloArquivo.innerText  = ( gmud.arquivosMudanca[i].titulo_arquivo !== undefined ? gmud.arquivosMudanca[i].titulo_arquivo : '' );
        td_nomeArquivo.innerText    = ( gmud.arquivosMudanca[i].nome_arq       !== undefined ? gmud.arquivosMudanca[i].nome_arq       : '' );
        td_extensaoArq.innerText    = ( gmud.arquivosMudanca[i].tipo_Arq       !== undefined ? gmud.arquivosMudanca[i].tipo_Arq       : '' );
	}
}

function FormataStringData(data) {
/*
	    var dia  = data.split("/")[0];
	    var mes  = data.split("/")[1];
	    var ano  = data.split("/")[2];
	   return ano + '-' + ("0"+mes).slice(-2) + '-' + ("0"+dia).slice(-2);
*/	 
	  	const dataCriada = new Date(data);
	  	const dataFormatada = dataCriada.toLocaleDateString('pt-BR', {timeZone: 'UTC',}); // Saida: 21/08/1988
	  	//const dataFormatada = dataCriada.toLocaleString('pt-BR', { timezone: 'UTC' }); // Saida: 20/10/2023 07:11:08
	  	return dataFormatada;
}	


