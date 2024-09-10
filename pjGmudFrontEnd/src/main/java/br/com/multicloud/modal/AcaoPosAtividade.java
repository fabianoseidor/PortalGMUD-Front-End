package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;


public class AcaoPosAtividade implements Serializable{

	private static final long serialVersionUID = 7949771339086353423L;

	private Long id_acao_pos_atividade;
	private String plano_teste;
	private String plano_rollback;
	private LocalDateTime dt_criacao;
	private Mudanca mudanca;



	public Long getId_acao_pos_atividade() {
		return id_acao_pos_atividade;
	}


	public void setId_acao_pos_atividade(Long id_acao_pos_atividade) {
		this.id_acao_pos_atividade = id_acao_pos_atividade;
	}


	public String getPlano_teste() {
		return plano_teste;
	}


	public void setPlano_teste(String plano_teste) {
		this.plano_teste = plano_teste;
	}


	public String getPlano_rollback() {
		return plano_rollback;
	}


	public void setPlano_rollback(String plano_rollback) {
		this.plano_rollback = plano_rollback;
	}


	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}


	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}


	public Mudanca getMudanca() {
		return mudanca;
	}


	public void setMudanca(Mudanca mudanca) {
		this.mudanca = mudanca;
	}


	@Override
	public String toString() {
		return "AcaoPosAtividade [id_acao_pos_atividade=" + id_acao_pos_atividade + ", plano_teste=" + plano_teste
				+ ", plano_rollback=" + plano_rollback + ", dt_criacao=" + dt_criacao + ", mudanca=" + mudanca + "]";
	}
        
	
}
