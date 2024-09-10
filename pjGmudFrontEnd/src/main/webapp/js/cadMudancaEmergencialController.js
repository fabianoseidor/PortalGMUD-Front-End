 	listaImpactoMudanca(0);
    listaCriticidade(0);
    listaClientesAfetados(0);
    listaAprovador(0);
    listaResponsavelAtividade(0);
	listaCicloUpdateCliente ();
	
	inlineCheckbox2.addEventListener('click', ()=>{

	  if(inlineCheckbox2.checked) {
		
		var strDataExecucao     = document.getElementById('dataExecucao').value;
		var partesDataExecucao  = strDataExecucao.split("/");		
		var strHoraExecucao     = document.getElementById('horarioInicio').value;
		var partesHoraExecucao  = strHoraExecucao.split(":");	
		var dataExecucao        = new Date(partesDataExecucao[2], partesDataExecucao[1] - 1, partesDataExecucao[0], partesHoraExecucao[0], partesHoraExecucao[1]);

		var strDataConclusao    = document.getElementById('dataPrevistaConclusao').value;
		var partesDataConclusao = strDataConclusao.split("/");
		var strHoraConclusao    = document.getElementById('HorarioPrevistoConclusao').value;
		var partesHoraConclusao = strHoraConclusao.split(":");
		var dataConclusao       = new Date(partesDataConclusao[2], partesDataConclusao[1] - 1, partesDataConclusao[0], partesHoraConclusao[0], partesHoraConclusao[1]);

		var DuracaoTafefMinutos = timeDiff(dataExecucao, dataConclusao);
		var durVonvert          = convertHoraMinutos(DuracaoTafefMinutos);
		
		var a = durVonvert.split(':'); // split it at the colons
		var hour = a[0];
		var min  = a[1];

		document.getElementById("duracaoTarefa").value = hour + ":" + min;
		document.getElementById("dataTarefa"   ).value = strDataExecucao;
		
		dataTarefa.disabled    = true; 
		duracaoTarefa.disabled = true; 
	  } else {
		$("#dataTarefa").val( '' );
		$("#duracaoTarefa").val( '' );

		dataTarefa.disabled    = false; 
		duracaoTarefa.disabled = false; 
	  }
	})
	
	function convertHoraMinutos(minutos){
		
		  let horas = Math.floor(minutos/ 60);          
		  let min = minutos % 60;
		  let textoHoras = (`00${horas}`).slice(-2);
		  let textoMinutos = (`00${min}`).slice(-2);
		  
		  let hrInt =  parseInt(textoHoras);
		  
		  if( hrInt > 23 ) textoHoras = '23';
		  
		  return `${textoHoras }:${textoMinutos}`;

	}	
	
	function iniciarTimeDuracao(){		
		$("#duracaoTarefa").val('00:00');
	}
	
	function atualizaInfoJanela(){
		var dtInicio = document.getElementById("dataExecucao"            ).value;
		var hrInicio = document.getElementById("horarioInicio"           ).value;
		var dtfim    = document.getElementById("dataPrevistaConclusao"   ).value;
		var hrfim = document.getElementById("HorarioPrevistoConclusao").value;
		let info     = ' ' +dtInicio + ' ' + hrInicio + ' - ' + dtfim + ' ' + hrfim;
		
		document.getElementById("info").textContent = info;
	}

		function desabilitaBotaoSalvar(){
	       document.getElementById("btSalvarGMUDNormal").disabled = true;
	}
		
	function validacaoDataHoraInicioGMUD(){
		var strDataExecucao     = document.getElementById('dataExecucao').value;
		var partesDataExecucao  = strDataExecucao.split("/");		
		var strHoraExecucao     = document.getElementById('horarioInicio').value;
		var partesHoraExecucao  = strHoraExecucao.split(":");	
		var dataExecucao        = new Date( partesDataExecucao[2], partesDataExecucao[1] - 1, partesDataExecucao[0], partesHoraExecucao[0], partesHoraExecucao[1] );
		var dataAtual           = new Date( );
		
		if( strDataExecucao.trim() === '' ){
			MensagemConfimacao( "warning", "Validação de Datas", "Favor selecionar a Data de Execução!" ) ;
			$("#horarioInicio").val('');
			return false;
		}

		var difDtEmHora = timeDiff( dataAtual, dataExecucao );
		
		if( difDtEmHora < 0 ){
			MensagemConfimacao( "warning", "Validação de Datas", "A Hora de Início da GMUD, não poderá ser menor que a hora atual! " ) ;
			$("#horarioInicio").val('');
			return false;
		}
		
		$("#HorarioPrevistoConclusao").val('');
		$("#dataPrevistaConclusao"   ).val('');

	}
	
	function validacaoDataHoraFimGMUD(){
		var strDataExecucao     = document.getElementById('dataExecucao').value;
		var partesDataExecucao  = strDataExecucao.split("/");		
		var strHoraExecucao     = document.getElementById('horarioInicio').value;
		var partesHoraExecucao  = strHoraExecucao.split(":");	
		var dataExecucao        = new Date( partesDataExecucao[2], partesDataExecucao[1] - 1, partesDataExecucao[0], partesHoraExecucao[0], partesHoraExecucao[1] );

		var strDataConclusao    = document.getElementById('dataPrevistaConclusao').value;
		var partesDataConclusao = strDataConclusao.split("/");
		var strHoraConclusao    = document.getElementById('HorarioPrevistoConclusao').value;
		var partesHoraConclusao = strHoraConclusao.split(":");
		var dataConclusao       = new Date(partesDataConclusao[2], partesDataConclusao[1] - 1, partesDataConclusao[0], partesHoraConclusao[0], partesHoraConclusao[1]);

		var difDtEmHora = timeDiff(dataExecucao, dataConclusao);
				
		
		if( strDataConclusao.trim() === '' ){
			MensagemConfimacao( "warning", "Validação de Datas", "Favor selecionar a Data de Fim da GMUD!" ) ;
			$("#HorarioPrevistoConclusao").val('');
			return false;
		}
		
		if( difDtEmHora < 0 ){
			MensagemConfimacao( "warning", "Validação de Datas", "A Hora de Fim da GMUD, não poderá ser menor que a hora de Início da GMUD!" ) ;
			$("#HorarioPrevistoConclusao").val('');
			return false;
		}
	}
	

	function validacaoDataHoraTarefaJanelaGMUD(){

				
		var strDataExecucao     = document.getElementById('dataExecucao').value;
		var partesDataExecucao  = strDataExecucao.split("/");		
		var strHoraExecucao     = document.getElementById('horarioInicio').value;
		var partesHoraExecucao  = strHoraExecucao.split(":");	
		var dataExecucao        = new Date(partesDataExecucao[2], partesDataExecucao[1] - 1, partesDataExecucao[0], partesHoraExecucao[0], partesHoraExecucao[1]);

		var strDataConclusao    = document.getElementById('dataPrevistaConclusao').value;
		var partesDataConclusao = strDataConclusao.split("/");
		var strHoraConclusao    = document.getElementById('HorarioPrevistoConclusao').value;
		var partesHoraConclusao = strHoraConclusao.split(":");
		var dataConclusao       = new Date(partesDataConclusao[2], partesDataConclusao[1] - 1, partesDataConclusao[0], partesHoraConclusao[0], partesHoraConclusao[1]);
		
        var difDtEmHora = timeDiff(dataExecucao, dataConclusao);
		
		var strDataTarefa    = document.getElementById('dataTarefa').value;
		var partesDataTarefa = strDataTarefa.split("/");
		var strDuracaoTa    = document.getElementById('duracaoTarefa').value;
		var partesDuracaoTa  = strDuracaoTa.split(":");	
		var dataTarefa       = new Date(partesDataTarefa[2], partesDataTarefa[1] - 1, partesDataTarefa[0], partesDuracaoTa[0], partesDuracaoTa[1]);
		
		if( strDataTarefa.trim() === '' ){
			MensagemConfimacao( "warning", "Validação de Datas", "Favor selecionar a Data da tarefa" ) ;
			$("#duracaoTarefa").val('');
			return false;
		}		
				
		var dataBaseCalTaref = new Date(partesDataExecucao[2], partesDataExecucao[1] - 1, partesDataExecucao[0]);
		
		var DuracaoTafefMinutos = timeDiff(dataBaseCalTaref, dataTarefa);
		
		if( DuracaoTafefMinutos > difDtEmHora ){
			MensagemConfimacao( "error", "Validação de Tarefa", "A Duração de " + DuracaoTafefMinutos +" minutos da Tarefa, não poderá ser maior que a Janela da GMUD, que tem o total de " + difDtEmHora + " minutos!") ;
			$("#duracaoTarefa").val('');
			return false;
		}		

	}
	
	function timeDiff(d1, d2) {
		const datetime1 = d1;
		const datetime2 = d2;

		const diferencaEmMilissegundos = datetime2.getTime() - datetime1.getTime();
		const diferencaEmMinutos = diferencaEmMilissegundos / (1000 * 60);

//		console.log(`A diferença entre ${datetime1} e ${datetime2} é de ${diferencaEmMinutos} minutos.`);		
		
		return diferencaEmMinutos;
	}	    
	

	function validaDateExecucao(){
//		var strData = "28/02/2015";
		var strData = document.getElementById('dataExecucao').value;
		
		var partesData = strData.split("/");
		var data = new Date(partesData[2], partesData[1] - 1, partesData[0]);
		var dataAtual = new Date();
		var dataCorrnte = new Date( dataAtual.getFullYear(), dataAtual.getMonth(), dataAtual.getDate() );
		if(data < dataCorrnte ){
		   MensagemConfimacao( "error", "Validação de Datas", "A Data de Execução não pode ser menor que a 'Data Corrente'" ) ;
		   const novaData = new Date();
		   $("#dataExecucao").val(novaData.toLocaleDateString('pt-BR'));
		}
		
		$("#dataPrevistaConclusao").val('');
	}
	
	function validaDateConclusao(){
		var strDataExecucao = document.getElementById('dataExecucao').value;
		if( strDataExecucao.trim() === '' ){
			MensagemConfimacao( "warning", "Validação de Datas", "Favor selecionar a Data de Execução!" ) ;
			$("#dataPrevistaConclusao").val('');
			return false;
		}

		var strData = document.getElementById('dataPrevistaConclusao').value;
		var partesData = strData.split("/");
		var data = new Date(partesData[2], partesData[1] - 1, partesData[0]);
		
		var partesDataExecucao = strDataExecucao.split("/");
		var dataExecucao = new Date(partesDataExecucao[2], partesDataExecucao[1] - 1, partesDataExecucao[0]);
		
		if(data < dataExecucao){
		   MensagemConfimacao( "error", "Validação de Datas", "A Data Conclusão não pode ser menor que a 'Data de Execução'" ) ;
		    $("#dataPrevistaConclusao").val('');
		}
	}
	
	
	function validacaoDtTarefaDentroDtGMUD(){
		var strDataExecucao     = document.getElementById('dataExecucao').value;
		var partesDataExecucao  = strDataExecucao.split("/");
		var dataExecucao        = new Date(partesDataExecucao[2], partesDataExecucao[1] - 1, partesDataExecucao[0]);
		var strDataConclusao    = document.getElementById('dataPrevistaConclusao').value;
		var partesDataConclusao = strDataConclusao.split("/");
		var dataConclusao       = new Date(partesDataConclusao[2], partesDataConclusao[1] - 1, partesDataConclusao[0]);
		
		var strDataTarefa    = document.getElementById('dataTarefa').value;
		var partesDataTarefa = strDataTarefa.split("/");
		var dataTarefa       = new Date(partesDataTarefa[2], partesDataTarefa[1] - 1, partesDataTarefa[0]);
		
		let valorTarefa    = dataTarefa.valueOf();
		let valorExecucao  = dataExecucao.valueOf();
		let valorConclusao = dataConclusao.valueOf();
		
		if( valorTarefa < valorExecucao ){
			MensagemConfimacao( "error", "Validação de Datas", "A Data da tarefa deve estar entre a Data de Execução: '" + strDataExecucao + "' e a Data de Conclusão: '" + strDataConclusao +"'") ;
			$("#dataTarefa").val('');
			return false;
		}else if( valorTarefa > valorConclusao ){
			      MensagemConfimacao( "error", "Validação de Datas", "A Data da tarefa deve estar entre a Data de Execução: '" + strDataExecucao + "' e a Data de Conclusão: '" + strDataConclusao +"'") ;
				  $("#dataTarefa").val('');
				  return false;
		}
		
	}
   
    /******************************************************************/
    /*                                                                */
    /*                                                                */
    /******************************************************************/
         $(function () {
         $('#arqUpload').change(function() {

  //      	 alert("Arq: " + $(this).val() ); 
        	 $("#caminhoArquivo").val( $(this).val() );
        	 
         });
     }); 
    function getNameArq( arqUploadAprovCliente ) {
		
		var fileName = document.getElementById(arqUploadAprovCliente).files[0];
		var pos = fileName.name.lastIndexOf(".")+1;
		var extesao = fileName.name.substring(pos);

		$("#nomeArquivo").val( fileName.name );
		$("#extensaoArq").val( extesao );
    	
    //	alert("fileName: " + fileName.name ); 
	}

    
     $(function () {
         $('#arqUploadAprovCliente').change(function() {

  //      	 alert("Arq: " + $(this).val() ); 
        	 $("#caminhoArqAprovCliente").val( $(this).val() );
        	 
         });
     }); 

    function getNameArqAprovCliente( arqUploadAprovCliente ) {
		
    	var fileName = document.getElementById(arqUploadAprovCliente).files[0];
    	var pos = fileName.name.lastIndexOf(".")+1;
    	var extesao = fileName.name.substring(pos);
    	
    	$("#nomeArqAprovCliente"    ).val( fileName.name );
    	$("#extensaoArqAprovCliente").val( extesao       );
    	
    //	alert("fileName: " + fileName.name ); 
	}
 
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
    $(document).ready(function() {
	  $("input").keyup(function(){
	    $(this).val($(this).val().toUpperCase());
	  })
	  
	  $("textarea").keyup(function(){
	    $(this).val($(this).val().toUpperCase());
	  })
	}) 
	
    //////////////////////////////////////////////////////////////////////////////////////////////////
    var dtExecucao = $("#dataExecucao").val();
    if (dtExecucao != null && dtExecucao != '') {
   	var dataExecucao = new Date(dtExecucao);
   	$("#dataExecucao").val(dateFormat.toLocaleDateString('pt-BR',{timeZone: 'UTC'}));
    }

    $( function() {
   	  
   	  $("#dataExecucao").datepicker({
   		    dateFormat: 'dd/mm/yy',
   		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
   		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
   		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
   		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
   		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
   		    nextText: 'Próximo',
   		    prevText: 'Anterior'
   		});
     } );
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    var dtPrevistaExecucao = $("#dataPrevistaConclusao").val();
    if (dtPrevistaExecucao != null && dtPrevistaExecucao != '') {
   	var dtPrevistaExecucao = new Date(dtPrevistaExecucao);
   	$("#dataPrevistaConclusao").val(dateFormat.toLocaleDateString('pt-BR',{timeZone: 'UTC'}));
    }

    $( function() {
   	  
   	  $("#dataPrevistaConclusao").datepicker({
   		    dateFormat: 'dd/mm/yy',
   		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
   		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
   		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
   		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
   		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
   		    nextText: 'Próximo',
   		    prevText: 'Anterior'
   		});
     } );
    
    $( function() {
     	  
     	  $("#dataTarefa").datepicker({
     		    dateFormat: 'dd/mm/yy',
     		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
     		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
     		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
     		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
     		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
     		    nextText: 'Próximo',
     		    prevText: 'Anterior'
     		});
       } );
   
    $(document).ready(function(){
        //Esconde todos os passos e exibe o primeiro ao carregar a página 
        $('.step').hide();
        $('.step').first().show();

        //Exibe no topo em qual passo estamos pela ordem da div que esta visivel
        var passoexibido = function(){
            var index = parseInt($(".step:visible").index());
            // alert("index: " + index + " - Total: " + $(".step").length );
            let legendaPasso = '';
            
            if(index == 0){
                //Se for o primeiro passo desabilita o botão de voltar
                $("#prev").prop('disabled',true);
            }else if(index == (parseInt($(".step").length)-1)){
                //Se for o ultimo passo desabilita o botão de avançar
                // $("#next").prop('disabled',true);
				document.getElementById('divBtProximo').style.display = 'none';
				document.getElementById('divBtSalvar').style.display = 'inline';				
            }else{
                //Em outras situações os dois serão habilitados
                // $("#next").prop('disabled',false);            
                $("#prev").prop('disabled',false);
				document.getElementById('divBtSalvar').style.display = 'none';
				document.getElementById('divBtProximo').style.display = 'inline';                     
			}
            if( index === 0 ){
    			legendaPasso = index + 1 + ' ( Dados de Identificação da Mudança )';
    		}else if( index === 1 ){
    			legendaPasso = index + 1 + ' ( Aprovadores )';
    		}else if( index === 2 ){
    			legendaPasso = index + 1 + ' ( Plano de Comunicação )';
    		}else if( index === 3 ){
    			legendaPasso = index + 1 + ' ( Plano de execução - Tarefas )';
    		}else if( index === 4 ){
    			legendaPasso = index + 1 + ' ( Ações pós atividades )';
    		}else if( index === 5 ){
    			legendaPasso = index + 1 + ' ( Anexar Arquivos )';
    		}else if( index === 6 ){
    			legendaPasso = index + 1 + ' ( Revisão )';
    		}
            
            $("#passo").html( legendaPasso );

        };
        
        //Executa a função ao carregar a página
        passoexibido();

        /* avança para o próximo passo ( Verssao original! )
        $("#next").click(function(){
            $(".step:visible").hide().next().show();
            passoexibido();
        });
        */
        
    //avança para o próximo passo
    $("#next").click(function(){
		
		var index = parseInt($(".step:visible").index()) ;
//		alert('index: ' + index);
        if( index === 0 ){
			if(validaStep('.step_1_validar')){
			   mudancaEmergencial.salvarMudancaEmergencial();
               $(".step:visible").hide().next().show();
               passoexibido();
            }
		}else if( index === 1 ){
			if(mudancaEmergencial.validacaoAprovadores())
			   MensagemConfimacao( "warning", "Validação de Campos", "Favor selecionar um Aprovador!" ) ;
            if(mudancaEmergencial.validacaoArqClieAprovacao())
				MensagemConfimacao( "warning", "Validação de Campos", "Favor Anexar o(s) arquivo(s) de Aprovação do(s) Cliene(s)!" ) ;
			else{
				$(".step:visible").hide().next().show();
				passoexibido();
			} 
			
		}else if( index === 2 ){			
			if( mudancaEmergencial.validacaoClientesAfetados() ){
			   MensagemConfimacao( "warning", "Validação de Campos", "Favor selecionar pelo menos um Clientes Afetado pela Mudança!" );
			}else if( mudancaEmergencial.validacaoPlanoComunicacoes() ){
			   MensagemConfimacao( "warning", "Validação de Campos", "Favor selecionar pelo menos uma Pessoa a ser informada sobre a Mudança!" );
			}else{
			   $(".step:visible").hide().next().show();
               passoexibido();
			}			
		}else if( index === 3 ){			
			if( mudancaEmergencial.validacaoTarefas() ){
			   MensagemConfimacao( "warning", "Validação de Campos", "Favor a criar uma Tarefa para a Mudança!" );
			}else{
			   $(".step:visible").hide().next().show();
               passoexibido();
			}			
		}else if( index === 4 ){			
			if(validaStep('.step_5_validar')){
			   mudancaEmergencial.salvarAcaosPosAtividades();
			   $(".step:visible").hide().next().show();
               passoexibido();
            }
		}else{
		   if( index === 5 ) mudancaEmergencial.mostraResumoTela();
           $(".step:visible").hide().next().show();
           passoexibido();			
		}
		
    });
               

        //retrocede para o passo anterior
        $("#prev").click(function(){
            $(".step:visible").hide().prev().show();
            passoexibido();
        });

     });

 
 function validaStep( stepValidate ){
	let valid = true;                         
	let formulario = document.querySelector('.formCadMudancaEmergencialValidacao');
	
//	let formulario = document.getElementById("formCadastroContrato");

	for( let errorText of formulario.querySelectorAll('.error-text') ){
		 errorText.remove();
	}
	
	for( let campo of formulario.querySelectorAll(stepValidate) ){
		 const label = campo.previousElementSibling.innerText;
		 if(!campo.value){
			criaErro(campo, `O campo "${label}" não pode esta vazio!`);
			valid = false;
		 }
	}
	return valid;
 }


 function criaErro(campo, msg){
	const div = document.createElement('div');
	div.innerHTML = msg;
	div.classList.add('error-text');
	campo.insertAdjacentElement("afterend", div);
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
function MensagemConfimacao( iconi, tituloPrincipal, textoPrincipal ) {
// icon
//	  	"warning"
//	  	"error"
//	  	"success"
//	  	"info"

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
function listaImpactoMudanca(idImpactoMudanca){

	let urlBase = document.getElementById('urlAPI').value;
	let urlAPI  = urlBase + 'listaImpactoMudanca';
		
	$.ajax({
		method : "GET",
//		url : "http://localhost:8090/PortalMudanca/listaImpactoMudanca",
		url : urlAPI,
		contentType : "application/json; charset=utf-8",
		success : function(json) {
		    var option = '<option value="" disabled selected>[-Selecione-]</option>';

			for(var p = 0; p < json.length; p++){
				if( json[p].id_impacto_mudanca === idImpactoMudanca  )
			  	     selected = 'selected';
				 else selected = '';
				
				option += '<option value=' + json[p].id_impacto_mudanca + ' ' + selected + '>' + json[p].impacto_mudanca + '</option>';
			}
			$("#impactoMudanca").html(option).show();  
			
		}
	}).fail(function(xhr) {
		// alert("Erro ao Listar informacoes de Impacto Mudanca: " + xhr.responseText);
		MensagemConfimacao( "error", "Impacto Mudança", "Erro ao Listar Impacto Mudança: " + xhr.responseText) ; 
	});		
}
/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
function listaCriticidade(idCriticidade){
	let urlBase = document.getElementById('urlAPI').value;
	let urlAPI  = urlBase + 'listaCriticidade';
		
	$.ajax({
		method : "GET",
//		url : "http://localhost:8090/PortalMudanca/listaCriticidade",
		url : urlAPI,
		contentType : "application/json; charset=utf-8",
		success : function(json) {
		    var option = '<option value="" disabled selected>[-Selecione-]</option>';

			for(var p = 0; p < json.length; p++){
				if( json[p].id_criticidade === idCriticidade  )
			  	     selected = 'selected';
				 else selected = '';
				
				option += '<option value=' + json[p].id_criticidade + ' ' + selected + '>' + json[p].criticidade + '</option>';
			}
			$("#urgenciaMudanca").html(option).show();  
			
		}
	}).fail(function(xhr ) {
		// alert("Erro ao Listar informacoes de Criticidade: " + xhr.responseText);
		MensagemConfimacao( "error", "Criticidade", "Erro ao Listar Criticidade Mudança: " + xhr.responseText); 
	});		
}

/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
function listaClientesAfetados(idClientes_af){
	let urlBase = document.getElementById('urlAPI').value;
	let urlAPI  = urlBase + 'listaClientesAfetados';
	
	$.ajax({
		method : "GET",
//		url : "http://localhost:8090/PortalMudanca/listaClientesAfetados",
		url : urlAPI,
		contentType : "application/json; charset=utf-8",
		success : function(json) {
		    var option = '<option value="" disabled selected>[-Selecione-]</option>';

			for(var p = 0; p < json.length; p++){
				if( json[p].id_clientes_af === idClientes_af  )
			  	     selected = 'selected';
				 else selected = '';
				
				option += '<option value=' + json[p].id_clientes_af + ' ' + selected + '>' + json[p].nome_cliente + '</option>';
			}
			$("#selectClientesAfetados").html(option).show();  
			
		}
	}).fail(function(xhr ) {
		// alert("Erro ao Listar Clientes Afetados: " + xhr.responseText);
		MensagemConfimacao( "error", "Clientes Afetados", "Erro ao Listar Clientes Afetados: " + xhr.responseText);
	});		
}

/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
function funcSelectClientesAfetados() {
	 var idClientesAfetados = selectClientesAfetados.options[selectClientesAfetados.selectedIndex].value;
	 let urlBase = document.getElementById('urlAPI').value;
	 let urlAPI  = urlBase + 'obterClientesAfetadosPorId/';

	 $.ajax({ 			
		method      : "GET",
//		url         : "http://localhost:8090/PortalMudanca/obterClientesAfetadosPorId/" + idClientesAfetados,
		url         : urlAPI + idClientesAfetados,
		contentType : "application/json; charset=utf-8",
		success     : function(response) {
						$("#idClienteAfetado"  ).val( response.id_clientes_af );
						$("#nomeClienteAfetado").val( response.nome_cliente   );
   	   }
  	 }).fail(function( xhr ){
 			// alert("Erro ao Listar Mudanças: " + xhr.responseText); 
			MensagemConfimacao( "error", "Clientes Afetados", "Erro ao Selecionar Clientes Afetados: " + xhr.responseText);
  	 }); 
}

/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
function listaAprovador(idAprovadores){
	 let urlBase = document.getElementById('urlAPI').value;
	 let urlAPI  = urlBase + 'listaAprovador';
	
	$.ajax({
		method : "GET",
//		url : "http://localhost:8090/PortalMudanca/listaAprovador",
		url : urlAPI,
		contentType : "application/json; charset=utf-8",
		success : function(json) {
		    var option = '<option value="" disabled selected>[-Selecione-]</option>';

			for(var p = 0; p < json.length; p++){
				if( json[p].idAprovadores === idAprovadores  )
			  	     selected = 'selected';
				 else selected = '';
				
				option += '<option value=' + json[p].idAprovadores + ' ' + selected + '>' + json[p].aprovador + '</option>';
			}
			$("#selectAprovadores").html(option).show();  
			
		}
	}).fail(function(xhr ) {
		// alert("Erro ao Listar Aprovadores: " + xhr.responseText);
		MensagemConfimacao( "error", "Aprovador", "Erro ao Listar Aprovadores: " + xhr.responseText);
	});		
}

/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
 function preencheSelectAprovadores() {
	 
	 var id_Aprovadores = selectAprovadores.options[selectAprovadores.selectedIndex].value;
	 let urlBase = document.getElementById('urlAPI').value;
	 let urlAPI  = urlBase + 'obterAprovador/';
	 
	 $.ajax({ 			
		method      : "GET",
//		url         : "http://localhost:8090/PortalMudanca/obterAprovador/" + id_Aprovadores,
		url         : urlAPI + id_Aprovadores,
		contentType : "application/json; charset=utf-8",
		success     : function(response) {
						$("#idAprovador"   ).val( response.idAprovadores );
						$("#nomeAprovador" ).val( response.aprovador     );
						$("#emailAprovador").val( response.email         );
   	   }
  	 }).fail(function( xhr ){
 			// alert("Erro ao Listar Mudanças: " + xhr.responseText); 
			MensagemConfimacao( "error", "Mudanças", "Erro ao Listar Mudanças: " + xhr.responseText);
  	 }); 
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
//		url : "http://localhost:8090/PortalMudanca/listaResponsavelAtividade",
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
		//alert("Erro ao Listar Plano de comunicação: " + xhr.responseText);
		MensagemConfimacao( "error", "Plano de comunicação", "Erro ao Listar Plano de comunicação: " + xhr.responseText);
	});		
}

/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
function funcSelectResponsavelTarefa() {
	 
	 var idResponsavelAtividade = selectResponsavelTarefa.options[selectResponsavelTarefa.selectedIndex].value;
	 let urlBase = document.getElementById('urlAPI').value;
	 let urlAPI  = urlBase + 'obterResponsavelAtividadePorId/';

	 $.ajax({ 			
		method      : "GET",
//		url         : "http://localhost:8090/PortalMudanca/obterResponsavelAtividadePorId/" + idResponsavelAtividade,
		url         : urlAPI + idResponsavelAtividade,
		contentType : "application/json; charset=utf-8",
		success     : function(response) {
						$("#idResponsavelTarefa"   ).val( response.id_responsavel_atividade    );
						$("#nomeResponsavelTarefa" ).val( response.responsavel_atividade       );
						$("#emailResponsavelTarefa").val( response.email_responsavel_atividade );
   	   }
  	 }).fail(function( xhr ){
 			// alert("Erro ao Listar Mudanças: " + xhr.responseText); 
			MensagemConfimacao( "error", "Responsável Tarefa", "Erro ao Selecionar Responsável Tarefa: " + xhr.responseText);

  	 }); 
}

/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
function listaClientesAfetadosPorCiclo( cicloUp ){
	 let urlBase = document.getElementById('urlAPI').value;
	 let urlAPI  = urlBase + 'clientesAfetadosPorCiclo/' + cicloUp;
	
	$.ajax({
		method : "GET",
//		url : "http://localhost:8090/PortalMudanca/listaClientesAfetados",
		url : urlAPI,
		contentType : "application/json; charset=utf-8",
		success : function(json) {
		    
			mudancaEmergencial.limparListaClientesAfetados();
			for(var p = 0; p < json.length; p++){
				let clientesAfetado = {};
				clientesAfetado.idCliAfetados = mudancaEmergencial.idCliAfetados;
				clientesAfetado.idClienteAfet = json[p].id_clientes_af;
				clientesAfetado.clienteAfet   = json[p].nome_cliente;
				clientesAfetado.cicloUpdate   = json[p].ciclo_update;
				
				mudancaEmergencial.adicionarClientesAfetado(clientesAfetado);
			    
			}
			mudancaEmergencial.listaTabelaClientesAfetado( mudancaEmergencial.listaClientesAfetados );
			
		}
	}).fail(function(xhr ) {
		// alert("Erro ao Listar Clientes Afetados: " + xhr.responseText);
		MensagemConfimacao( "error", "Clientes Afetados", "Erro ao Listar Clientes Afetados: " + xhr.responseText );
	});		
}

/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
function listaCicloUpdateCliente (){
	 let urlBase = document.getElementById('urlAPI').value;
	 let urlAPI  = urlBase + 'listaCicloUpdate';
	
	$.ajax({
		method : "GET",
//		url : "http://localhost:8090/PortalMudanca/listaClientesAfetados",
		url : urlAPI,
		contentType : "application/json; charset=utf-8",
		success : function(json) {
		    var option = '<option value="" disabled selected>[-Selecione-]</option>';

			for(var p = 0; p < json.length; p++){
				option += '<option>' + json[p] + '</option>';
			}
			$("#selectCicloUpdateCliente").html(option).show();  
			
		}
	}).fail(function(xhr ) {
		// alert("Erro ao Listar Clientes Afetados: " + xhr.responseText);
		MensagemConfimacao( "error", "Clientes Afetados", "Erro ao Listar Clientes Afetados: " + xhr.responseText );
	});		
}

	