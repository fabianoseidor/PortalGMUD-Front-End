/**
 * Class de Cadastro de Mudanca Padrao
 */
class CategoriaPadraoItem{
	constructor(){
		// Informacoes da Categoria Padrao
		this.dadosCatPadrao      = {}; 
		this.totalTempoGmud      = 0;
		this.ultimaSoma          = 0;
		this.prioridadeTask      = 0;
		// Informacoes dos Itens que conterao na Categoria Padrao
		this.idItemCatPadrao     = 1;
		this.listaItemCatPadrao  = []
	}
	
	limpaClasse(){
		this.dadosCatPadrao      = {}; 
		this.totalTempoGmud      = 0;
		this.prioridadeTask      = 0;
		this.ultimaSoma          = 0;
		// Informacoes dos Itens que conterao na Categoria Padrao
		this.idItemCatPadrao     = 1;
		this.listaItemCatPadrao  = []
		
	}
	
	// Chama a API para salvar a Mudança Padrao na base de Dados.
	salvarCategoriaPadrao(categoriaPadrao, obs, login){
		this.adicionarCategoriaPadrao(categoriaPadrao, obs, login);
	}

	// Adiciona as informacoes da tela no Objeto
	adicionarCategoriaPadrao( categoriaPadrao, obs, login ){
		this.dadosCatPadrao = this.lerDadosCategoriaPadrao(categoriaPadrao, obs, login);
	}
	
	// Adiciona as informacoes do STEP 1 nos atributos do objeto;
	lerDadosCategoriaPadrao( categoriaPadrao, obs, login ){
		let dadosCategoriaPadrao = {};
		/* Dados de Identificação da Mudança */
	    dadosCategoriaPadrao.categoria_padrao = categoriaPadrao
	    dadosCategoriaPadrao.obs              = obs;
		dadosCategoriaPadrao.login_user       = login;    

	    return dadosCategoriaPadrao;
	}
	
	/*************************************************************************************************************************/
	/*                                                                                                                       */
	/* Trata as informacoes de "Clientes afetados" no Step 3, para Adicionar, Editar e Deletar dentro do Arrey               */
	/*                                                                                                                       */
	/*************************************************************************************************************************/
	salvarItemCatPadrao(tituloCatPadrao, descCatPadrao, prioridade, duracao){
		let itemCatPadrao = this.lerDadosItemCatPadrao(tituloCatPadrao, descCatPadrao, prioridade, duracao);
		this.adicionarItemCatPadrao(itemCatPadrao);
	}
	adicionarItemCatPadrao(itemCatPadrao){
		this.listaItemCatPadrao.push(itemCatPadrao);
	    this.idItemCatPadrao++;
	}
	
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	lerDadosItemCatPadrao( tituloCatPadrao, descCatPadrao, prioridade, duracao ){
		let itemCatPadrao = {};
		itemCatPadrao.idItemCatPadrao = this.idItemCatPadrao;
		itemCatPadrao.tituloCatPadrao = tituloCatPadrao;
		itemCatPadrao.descCatPadrao   = descCatPadrao;
		itemCatPadrao.prioridade      = prioridade;		
		itemCatPadrao.duracao         = duracao;
		
		if( this.prioridadeTask === 0 ){
			this.totalTempoGmud = itemCatPadrao.duracao;
			this.ultimaSoma     = itemCatPadrao.duracao;
			this.prioridadeTask = itemCatPadrao.prioridade;
		}else 
		   if( this.prioridadeTask === itemCatPadrao.prioridade ){
			   if( this.ultimaSoma < itemCatPadrao.duracao ){
			       this.totalTempoGmud = ( this.totalTempoGmud - this.ultimaSoma ) +  itemCatPadrao.duracao;
				   this.ultimaSoma = itemCatPadrao.duracao;
		       }			      
		  }else 
		     if( this.prioridadeTask !== itemCatPadrao.prioridade ){
		   		 this.totalTempoGmud = this.totalTempoGmud + itemCatPadrao.duracao;
		   		 this.prioridadeTask = itemCatPadrao.prioridade;
				 this.ultimaSoma     = itemCatPadrao.duracao;
		   	 }

		return itemCatPadrao;
	}
	
	somaDataHora( totalMinTarefas ){
		
		Date.prototype.addHoras = function(horas){
		    this.setHours(this.getHours() + horas)
		};
		Date.prototype.addMinutos = function(minutos){
		    this.setMinutes(this.getMinutes() + minutos)
		};
		Date.prototype.addSegundos = function(segundos){
		    this.setSeconds(this.getSeconds() + segundos)
		};
		Date.prototype.addDias = function(dias){
		    this.setDate(this.getDate() + dias)
		};
		Date.prototype.addMeses = function(meses){
		    this.setMonth(this.getMonth() + meses)
		};
		Date.prototype.addAnos = function(anos){
		    this.setYear(this.getFullYear() + anos)
		};		
				
		var strDataConclusao    = document.getElementById('dataExecucao').value;
		var partesDataConclusao = strDataConclusao.split("/");
		var strHoraConclusao    = document.getElementById('horarioInicio').value;
		var partesHoraConclusao = strHoraConclusao.split(":");
		var dataConclusao       = new Date(partesDataConclusao[2], partesDataConclusao[1] - 1, partesDataConclusao[0], partesHoraConclusao[0], partesHoraConclusao[1]);
		
		dataConclusao.addMinutos(totalMinTarefas);
//		console.log(dataConclusao);
		return dataConclusao;
	}
}	

var categoriaPadraoItemClass = new CategoriaPadraoItem();