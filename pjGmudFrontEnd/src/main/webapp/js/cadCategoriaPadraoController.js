	
    window.onload = function() {
	    document.getElementById('prioridade').addEventListener('keydown', function(event)
	    {
	        if (!Math.sign(event.key))
	        {
	            event.preventDefault();
	        }
	    });
	}
	
	
	function iniciarTimeDuracao(){		
		$("#duracao").val('00:00');
	}

	
	function desabilitaBotaoSalvar(){
	       document.getElementById("btSalvarCategoriaPadrao").disabled = true;
	}
	
	
	function timeDiff(d1, d2) {
		const datetime1 = d1;
		const datetime2 = d2;

		const diferencaEmMilissegundos = datetime2.getTime() - datetime1.getTime();
		const diferencaEmMinutos = diferencaEmMilissegundos / (1000 * 60);

//		console.log(`A diferença entre ${datetime1} e ${datetime2} é de ${diferencaEmMinutos} minutos.`);		
		
		return diferencaEmMinutos;
	}	    
   
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
				document.getElementById('divBtSalvar').style.display = 'none';
				document.getElementById('divBtProximo').style.display = 'inline';         
				
            }else if(index == (parseInt($(".step").length))-1){
                //Se for o ultimo passo desabilita o botão de avançar
//                $("#next").prop('disabled',true);
                $("#prev").prop('disabled',false);
				document.getElementById('divBtProximo').style.display = 'none';
				document.getElementById('divBtSalvar').style.display = 'inline';
				
            }else{
                //Em outras situações os dois serão habilitados
//                $("#next").prop('disabled',false);            
                $("#prev").prop('disabled',false);				
				document.getElementById('divBtSalvar').style.display = 'none';
				document.getElementById('divBtProximo').style.display = 'inline';         
				
            }
            if( index === 0 ){
    			legendaPasso = index + 1 + ' ( Dados de Info Categoria Padrão )';
    		}else if( index === 1 ){
    			legendaPasso = index + 1 + ' ( Revisão )';
    		}
            
            $("#passo").html( legendaPasso );

        };
        
        //Executa a função ao carregar a página
        passoexibido();
        
    //avança para o próximo passo
    $("#next").click(function(){
		
		var index = parseInt($(".step:visible").index());
//		alert('index: ' + index);
        if( index === 0 ){
			if(validaStep('.step_1_validar')){
			   if( categoriaPadraoClass.validacaoItemCatPadrao() ){
				   MensagemConfimacao( "warning", "Validação de Campos", "Favor criar uma Tarefa para a Categoria Padrão!" );
			   }else{
			       categoriaPadraoClass.salvarCategoriaPadrao();
			       categoriaPadraoClass.mostraResumoTela();
                   $(".step:visible").hide().next().show();
                   passoexibido();
			   }
            }
		}else{		   
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
	let formulario = document.querySelector('.formCadMudancaPadraoValidacao');
	
//	let formulario = document.getElementById("formCadastroContrato");

	for( let errorText of formulario.querySelectorAll('.error-text') ){
		 errorText.remove();
	}
	
	for( let campo of formulario.querySelectorAll(stepValidate) ){
		 const label = campo.previousElementSibling.innerText;
		 let tipoCad = 0;
		 if(campo.id === "tipoCategoriaPadrao") {
			if(campo.value === "-1")  
			   tipoCad = 1;
		 }
		 
		 if(!campo.value || tipoCad === 1){
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
		MensagemConfimacao( "error", "Listar informacoes de Impacto Mudanca", "Erro ao Listar informacoes de Impacto Mudanca: " + xhr.responseText ) ;
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
		//alert("Erro ao Listar informacoes de Criticidade: " + xhr.responseText);
		MensagemConfimacao( "error", "Listar informacoes de Criticidade", "Erro ao Listar informacoes de Criticidade: " + xhr.responseText) ;
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
		MensagemConfimacao( "error", "Listar informacoes Clientes Afetados", "Erro ao Listar Clientes Afetados: " + xhr.responseText) ;
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
			MensagemConfimacao( "error", "Listar Mudanças", "Erro ao Listar Mudanças: " + xhr.responseText ) ;
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
		// alert("Erro ao Listar Plano de comunicação: " + xhr.responseText);
		MensagemConfimacao( "error", "Responsável Atividade", "Erro ao Listar os Responsável pelas Atividade: " + xhr.responseText ) ;
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
			MensagemConfimacao( "error", "Responsável Tarefa", "Erro ao Selecionar Responsável Tarefa: " + xhr.responseText );

  	 }); 
}


	