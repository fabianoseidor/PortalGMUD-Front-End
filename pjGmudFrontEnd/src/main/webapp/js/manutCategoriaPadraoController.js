funcListaCatPadraoPaginacao( 0 );


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

async function getTotalPagRenovacao( totalCad, offsetEnd ) {
	let pagina      = 0.0;
	
	pagina = totalCad / offsetEnd;
	
	let resto = pagina % 2;
	if(resto > 0) pagina++;
	
	return parseInt(pagina);
}


function formatDataStr( data ) {
	let tam    = data.length;
	let dtFort;
	   
	if( tam === 5 ){
		dtFort = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' + '00';
	   }else if( tam === 7 ){
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

/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
async function funcListaCatPadraoPaginacao( pag ) {
	// formManutMudancaPadrao
	try {
			showLoading();
			let OFFSET_END  = 10;
			let offsetBegin = 0;			
			let urlBase     = document.getElementById( 'urlAPI' ).value;
			const url       = urlBase + 'qtyCategoriaPadraoCadastrada';
			const data1     = await fetch(url).then(response => response.json());
			let totalPag    = 0;
			
			if( data1 > 0 ) totalPag = await getTotalPagRenovacao( data1, OFFSET_END );
			else throw 'Não existe Categoria Padrão cadastrada!';
			
			offsetBegin = pag * OFFSET_END;
			
			const urlListCatPadr = urlBase + '/listaCategoriaPadroesPag/' + offsetBegin + '/' + OFFSET_END;
						
			const data2 = await fetch(urlListCatPadr).then(response => response.json());

			let tbody = document.getElementById('tbodyCatPadraoCad');
			tbody.innerText = '';

			for(var i = 0; i < data2.length; i++){
				// Cria as linhas
				let tr = tbody.insertRow();
				// Crias as celulas
				
				let td_idCategoriaPadrao = tr.insertCell();
				let td_dtCriacao         = tr.insertCell();
				let td_loginUser         = tr.insertCell();
				let td_categoriaPadrao   = tr.insertCell();
				let td_obs               = tr.insertCell();
				let td_editar            = tr.insertCell();
				let td_delete            = tr.insertCell();
				
				td_idCategoriaPadrao.innerText = data2[i].id_categoria_padrao;
				td_dtCriacao.innerText         = formatData( 2, formatDataStr( data2[i].dt_criacao ) );
				td_loginUser.innerText         = data2[i].login_user;
				td_categoriaPadrao.innerText   = data2[i].categoria_padrao;
				td_obs.innerText               = data2[i].obs;
				
				// Botao Editar
				let imgEdit = document.createElement('img');
				imgEdit.src = getContextPath() +'/imagens/edit-20.png';
				let funcEdit = "editCatPadrao( " + JSON.stringify( data2[i] ) + ")";				
				imgEdit.setAttribute('onclick', funcEdit);
				imgEdit.setAttribute('data-toggle', 'tooltip' );
				imgEdit.setAttribute('data-placement', 'top' );
				imgEdit.setAttribute('title', 'Ir para o modulo "Edição!"' );
				td_editar.appendChild(imgEdit);
				td_editar.classList.add('center');

				// Botao Delete
				let imgDelete = document.createElement('img');
				imgDelete.src = getContextPath() +'/imagens/delete-20.png';
				let funcdelete = "deleteCatPadrao( " + data2[i].id_categoria_padrao + ")";
				imgDelete.setAttribute('onclick', funcdelete );
				imgDelete.setAttribute('data-toggle', 'tooltip' );
				imgDelete.setAttribute('data-placement', 'top' );
				imgDelete.setAttribute('title', 'Apagar Cat. Padrão!' );
				td_delete.appendChild(imgDelete);
				td_delete.classList.add('center');
				
				td_idCategoriaPadrao.classList.add('center');
			}
			
			$('#navegacaoPag > ul').remove();
			var liPaginacao = '<ul class="pagination">';
			for(var p = 0; p < totalPag; p++){
				  if( pag === p )
				      liPaginacao +=  "<li class=\"page-item active\" onclick=\"funcListaCatPadraoPaginacao(" + p + " ); \"><a class=\"page-link\" href=\"#\">" + ( p + 1 ) + "</a></li>";
				  else  
					liPaginacao +=  "<li class=\"page-item\" onclick=\"funcListaCatPadraoPaginacao(" + p + " ); \"><a class=\"page-link\" href=\"#\">" + ( p + 1 ) + "</a></li>";
			}

			liPaginacao += "</ul>";

			$("#navegacaoPag").html(liPaginacao).show(); 
			limparCatPadrao( ) ;
			limparItemCatPadrao(  );
			
			hideLoading();
	 
		} catch (error) {
		    hideLoading();
		    MensagemConfimacao( "warning", "Manutenção Cat. Padrão",  error );
		}
 
 }
 
async function deleteCatPadrao( id ){
	try {
	   
	   let urlBase = document.getElementById( 'urlAPI' ).value;
	   
	   let urlVali  = urlBase + 'chcekCategoriaPadraoMucanca/' + id;
	   const data1 = await fetch(urlVali, {
	   		        	  method : 'post',
	   		        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
	   		        	  body   : JSON.stringify({ text: 'OK'})
	   		        	}).then(response => response.text())
	   		        	  .then(body => { return body; });
	   
	   if( data1 > 0  ) throw 'Existe uma ou mais Mudança associada a esta Categoria Padrão, por este motico, ela não poderá ser deletada!';

	   let urlAPI  = urlBase + 'deleteCategoriaPadrao/' + id;
	   const data2 = await fetch(urlAPI, {
				        	  method : 'post',
				        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
				        	  body   : JSON.stringify({ text: 'OK'})
				        	}).then(response => response.text())
				        	  .then(body => { return body; });
							  						  
       if( data2 === 'Sucesso' ){
		 Swal.fire({
			   title: "Manutenção Cat. Padrão",
			   text : data2,
			   icon : "Categoria Padrão removido com sucesso!",
			   target: document.getElementById("modalFinalizarGMUD"),
			   showCancelButton: false,
			   confirmButtonColor: "#3085d6",
			   cancelButtonColor: "#d33",
			   confirmButtonText: "OK"
			 }).then((result) => {
			   if (result.isConfirmed) {
			       funcListaCatPadraoPaginacao( 0 );
			   }
			 });				 
      }else throw data2;
	  							  
    } catch (error) {
         hideLoading();
         MensagemConfimacao( "warning", "Manutenção Cat. Padrão",  error );
    }

 }
 
 async function deleteItemCategoria( id ){
 	try {
 	   
 	   let urlBase     = document.getElementById( 'urlAPI'            ).value;
 	   let idCatPadrao = document.getElementById( 'idCategoriaPadrao' ).value;
 	   let urlAPI  = urlBase + 'deleteItemCategoriaPadrao/' + id;
 	   const data2 = await fetch(urlAPI, {
 				        	  method : 'post',
 				        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
 				        	  body   : JSON.stringify({ text: 'OK'})
 				        	}).then(response => response.text())
 				        	  .then(body => { return body; });
							  	  						  
        if( data2 === 'Sucesso' ){
			let urlAPI  = urlBase + 'listaItemCategoriaPadrao/' + idCatPadrao;
			const data1 = await fetch(urlAPI).then(response => response.json());
	 		Swal.fire({
	 			   title: "Manutenção Cat. Padrão",
	 			   text : "Item Categoria Padrão removido com sucesso!",
	 			   icon : "success",
	 			   showCancelButton: false,
	 			   confirmButtonColor: "#3085d6",
	 			   cancelButtonColor: "#d33",
	 			   confirmButtonText: "OK"
	 		}).then((result) => {
	 			   if (result.isConfirmed){ 
					   listaIntens( data1 );
				       limparItemCatPadraoNovoItem( );
				   }
	 		});				 
       }else throw data2;
 	  							  
     } catch (error) {
          hideLoading();
          MensagemConfimacao( "warning", "Manutenção Cat. Padrão",  error );
     }

  } 
 
 function limparCatPadrao( ) {	
     $("#idCategoriaPadrao" ).val( '' );
     $("#dtCadastro"        ).val( '' );
     $("#categoriaPadrao"   ).val( '' );
     $("#login"             ).val( '' );
     $("#Obs"               ).val( '' );
 }
 
 function editCatPadrao( catPadrao ) {	
     $("#idCategoriaPadrao" ).val( catPadrao.id_categoria_padrao                           );
     $("#dtCadastro"        ).val( formatData( 2, formatDataStr( catPadrao.dt_criacao ) )  );
	 $("#categoriaPadrao"   ).val( catPadrao.categoria_padrao                              );
	 $("#login"             ).val( catPadrao.login_user                                    );
	 $("#Obs"               ).val( catPadrao.obs                                           );
	 
	 limparItemCatPadrao(  );
	 listaIntens( catPadrao.itensCategoriaPadrao );	 
 }
 
 
 function limparItemCatPadrao(  ) {	
     $("#idItemCategoriaPadrao" ).val( '' );
     $("#tituloCatPadrao"       ).val( '' );
     $("#duracao"               ).val( '' );
     $("#prioridade"            ).val( '' );
     $("#descCatPadrao"         ).val( '' );
	 let tbody = document.getElementById('tbItemCatPadrao');
	 tbody.innerText = '';	 
 }
 
 function limparItemCatPadraoNovoItem(  ) {	
     $("#idItemCategoriaPadrao" ).val( '' );
     $("#tituloCatPadrao"       ).val( '' );
     $("#duracao"               ).val( '' );
     $("#prioridade"            ).val( '' );
     $("#descCatPadrao"         ).val( '' );
 }
 
 function editItemCatPadrao( itemCatPadrao ) {	
     $("#idItemCategoriaPadrao" ).val( itemCatPadrao.id_itens_cat_padrao );
     $("#tituloCatPadrao"       ).val( itemCatPadrao.tituloCatPadrao     );
     $("#duracao"               ).val( itemCatPadrao.duracao             );
     $("#prioridade"            ).val( itemCatPadrao.prioridade          );
     $("#descCatPadrao"         ).val( itemCatPadrao.descCatPadrao       );
 }
 
 
 function listaIntens( listaItemCatPadrao ){
	let tbody = document.getElementById('tbItemCatPadrao');
	tbody.innerText = '';
			
	for(let i = 0; i < listaItemCatPadrao.length; i++){
		
		let tr = tbody.insertRow();
		
	    let td_tituloCatPadraoShow = tr.insertCell();
		let td_duracaoShow         = tr.insertCell();
		let td_prioridadeShow      = tr.insertCell();
		let td_descCatPadraoShow   = tr.insertCell();
		let td_editar              = tr.insertCell();
	    let td_delete              = tr.insertCell();
	    
	     // Inseri os valores do objeto nas celulas
	    td_tituloCatPadraoShow.innerText = ( listaItemCatPadrao[i].tituloCatPadrao !== undefined ? listaItemCatPadrao[i].tituloCatPadrao : '' );
		td_duracaoShow.innerText         = ( listaItemCatPadrao[i].duracao         !== undefined ? listaItemCatPadrao[i].duracao         : '' );
		td_prioridadeShow.innerText      = ( listaItemCatPadrao[i].prioridade      !== undefined ? listaItemCatPadrao[i].prioridade      : '' );
		td_descCatPadraoShow.innerText   = ( listaItemCatPadrao[i].descCatPadrao   !== undefined ? listaItemCatPadrao[i].descCatPadrao   : '' );
		/////////////////////////////////////////////////////////////////
		td_tituloCatPadraoShow.setAttribute('style', 'vertical-align: middle' );
		td_duracaoShow.setAttribute        ('style', 'vertical-align: middle' );
		td_prioridadeShow.setAttribute     ('style', 'vertical-align: middle' );
		td_descCatPadraoShow.setAttribute  ('style', 'vertical-align: middle' );
		td_delete.setAttribute             ('style', 'vertical-align: middle' );
		/////////////////////////////////////////////////////////////////
		// Botao Editar
		let imgEdit = document.createElement('img');
		imgEdit.src = getContextPath() +'/imagens/edit-20.png';
		let funcEdit = "editItemCatPadrao( " + JSON.stringify( listaItemCatPadrao[i] ) + ")";				
		imgEdit.setAttribute('onclick', funcEdit);
		imgEdit.setAttribute('data-toggle', 'tooltip' );
		imgEdit.setAttribute('data-placement', 'top' );
		imgEdit.setAttribute('title', 'Ir para o modulo "Edição!"' );
		td_editar.appendChild(imgEdit);
		td_editar.classList.add('center');
		
		// Botao Delete
		let imgDelete = document.createElement('img');
		imgDelete.src = getContextPath() +'/imagens/delete-20.png';
		let funcdelete = "deleteItemCategoria( " + listaItemCatPadrao[i].id_itens_cat_padrao + ")";
		imgDelete.setAttribute('onclick', funcdelete );
		imgDelete.setAttribute('data-toggle', 'tooltip' );
		imgDelete.setAttribute('data-placement', 'top' );
		imgDelete.setAttribute('title', 'Apagar Item Categoria!!' );
		td_delete.appendChild(imgDelete);
		td_delete.classList.add('center');
	    
	    td_duracaoShow.classList.add('center');
		td_prioridadeShow.classList.add('center');
		
	}
	
 }

async function salvarItemCatPadrao( ){
	try {	
		let idItemCategoriaPadrao = document.getElementById( 'idItemCategoriaPadrao').value;
		let tituloCatPadrao       = document.getElementById( 'tituloCatPadrao'      ).value;
		let duracao               = document.getElementById( 'duracao'              ).value;
		let prioridade            = document.getElementById( 'prioridade'           ).value;
		let descCatPadrao         = document.getElementById( 'descCatPadrao'        ).value;
		let idCatPadrao           = document.getElementById( 'idCategoriaPadrao'    ).value;
			
		if( (idCatPadrao === '') || (tituloCatPadrao === '') || (duracao === '') || (prioridade === '') || (descCatPadrao === '') ) 
		     throw 'Favor selecionar um Item!';	
		
		this.showLoading();
		
		let dados = {
			id_itens_cat_padrao: idItemCategoriaPadrao,
			tituloCatPadrao    : tituloCatPadrao      ,
			descCatPadrao      : descCatPadrao        ,
			duracao            : duracao              ,
			prioridade         : prioridade           ,
			categoriaPadrao    : {id_categoria_padrao:idCatPadrao}
		}
	
		let urlBase = document.getElementById('urlAPI').value;
	    let urlAPIPost  = urlBase + 'SalvarItemCategoriaPadrao';

		 const data1 = await fetch(urlAPIPost, {
		 		        	  method : 'post',
		 		        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
		 		        	  body   : JSON.stringify( dados )
		 		        	}).then(response => response.text())
		 		        	  .then(body => { return body; });
							  
		 if( data1 === null )throw data1;					  

		 let urlAPI  = urlBase + 'listaItemCategoriaPadrao/' + idCatPadrao;
		 const data2 = await fetch(urlAPI).then(response => response.json());
		 if( data2 !== null ){
			Swal.fire({
			  title: "Manutenção Cat. Padrão",
			  text : "ID Item( "+ idItemCategoriaPadrao +" ) atualizado com sucesso!",
			  icon : "success",
			  showCancelButton: false,
			  confirmButtonColor: "#3085d6",
			  cancelButtonColor: "#d33",
			  confirmButtonText: "OK"
			}).then((result) => {
			  if (result.isConfirmed) {
			      listaIntens( data2 );
			  }
			});				 			
		}else throw data2;
	 	
		hideLoading();
		   		
	} catch (error) {
	     hideLoading();
	     MensagemConfimacao( "warning", "Manutenção Cat. Padrão",  error );
	}
	
 }
 
 /******************************************************************/
 /*                                                                */
 /*                                                                */
 /******************************************************************/

async function getDadosApi( listaItemCatPadrao ){
 	////////////////////////////////////////////////////////////////////////////////////////////
 	////////////////////////////////////////////////////////////////////////////////////////////
 	let list_ItemCatPadrao = [];
 	for(let i = 0; i < listaItemCatPadrao.length; i++){
 	    let l_ItemCatPadrao = { tituloCatPadrao: listaItemCatPadrao[i].tituloCatPadrao,
 	                              descCatPadrao: listaItemCatPadrao[i].descCatPadrao  ,
 										duracao: listaItemCatPadrao[i].duracao        ,
 								     prioridade: listaItemCatPadrao[i].prioridade

 	                          };
         list_ItemCatPadrao.push(l_ItemCatPadrao);
 	}
	
 	////////////////////////////////////////////////////////////////////////////////////////////
 	////////////////////////////////////////////////////////////////////////////////////////////
 	let dadostCategoriaPadrao = { id_categoria_padrao  : document.getElementById( 'idCategoriaPadrao').value,
		                          categoria_padrao     : document.getElementById( 'categoriaPadrao').value  ,
 		                          login_user           : document.getElementById( 'login').value            ,
    	                          obs                  : document.getElementById( 'Obs').value              ,
    	                          itensCategoriaPadrao : list_ItemCatPadrao 
    	};  

    	return dadostCategoriaPadrao;     

 }
 
 async function salvarCatPadrao( ){
	try {
		let idCatPadrao = document.getElementById( 'idCategoriaPadrao' ).value;
			
		if( idCatPadrao === '' ) throw 'Favor selecionar uma Categoria!';	
		
		this.showLoading();
		
		let urlBase = document.getElementById('urlAPI').value;
		let urlAPI  = urlBase + 'listaItemCategoriaPadrao/' + idCatPadrao;
		const data1 = await fetch(urlAPI).then(response => response.json());
		
		if( data1 === null )throw data1;	
				
		let dados = await getDadosApi( data1 );
		let urlAPIPost  = urlBase + 'SalvarCategoriaPadrao';

		const data2 = await fetch(urlAPIPost, {
				        	  method : 'post',
				        	  headers: { 'Content-Type': 'application/json; charset=utf-8' },
				        	  body   : JSON.stringify( dados )
				        	}).then(response => response.text())
				        	  .then(body => { return body; });
							  							  
		 if( data2 !== null ){
			Swal.fire({
			  title: "Manutenção Cat. Padrão",
			  text : "Categoria atualizado com sucesso!",
			  icon : "success",
			  showCancelButton: false,
			  confirmButtonColor: "#3085d6",
			  cancelButtonColor: "#d33",
			  confirmButtonText: "OK"
			}).then((result) => {
			  if (result.isConfirmed) {
			      editCatPadrao( data2 );	
			  }
			});				 			
		}else throw data2;
		
		hideLoading();

	} catch (error) {
		hideLoading();
		MensagemConfimacao( "warning", "Manutenção Cat. Padrão",  error );
	}
			
 }	 
 
 /******************************************************************/
 /*                                                                */
 /*                                                                */
 /******************************************************************/
 function getContextPath() {
    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
 }

function showLoading(){
	$("#box_dark").css('display','flex');
	$("#box_dark_form").css('display','flex');
}

function hideLoading(){
	$("#box_dark").css('display','none');
	$("#box_dark_form").css('display','none');
}

	