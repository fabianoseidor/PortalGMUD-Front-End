package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;


public class AtividadeMudanca implements Serializable{

	private static final long serialVersionUID = 9118672086133844820L;

	private Long id_atividade_mudanca;
	private String titulo_atividade_mudanca;
	private String atividade_mudanca;
	private LocalDate dt_tarefa;
	private LocalTime duracao;
	private ResponsavelAtividade responsavelAtividade;
	private Mudanca mudanca;
	private StatusAtividade statusAtividade;
	
	public StatusAtividade getStatusAtividade() {
		return statusAtividade;
	}

	public void setStatusAtividade(StatusAtividade statusAtividade) {
		this.statusAtividade = statusAtividade;
	}

	public Long getId_atividade_mudanca() {
		return id_atividade_mudanca;
	}

	public void setId_atividade_mudanca(Long id_atividade_mudanca) {
		this.id_atividade_mudanca = id_atividade_mudanca;
	}

	public ResponsavelAtividade getResponsavelAtividade() {
		return responsavelAtividade;
	}

	public void setResponsavelAtividade(ResponsavelAtividade responsavelAtividade) {
		this.responsavelAtividade = responsavelAtividade;
	}

	public Mudanca getMudanca() {
		return mudanca;
	}

	public void setMudanca(Mudanca mudanca) {
		this.mudanca = mudanca;
	}

	public String getAtividade_mudanca() {
		return atividade_mudanca;
	}

	public void setAtividade_mudanca(String atividade_mudanca) {
		this.atividade_mudanca = atividade_mudanca;
	}

	public LocalTime getDuracao() {
		return duracao;
	}

	public void setDuracao(LocalTime duracao) {
		this.duracao = duracao;
	}

	public String getTitulo_atividade_mudanca() {
		return titulo_atividade_mudanca;
	}

	public void setTitulo_atividade_mudanca(String titulo_atividade_mudanca) {
		this.titulo_atividade_mudanca = titulo_atividade_mudanca;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_atividade_mudanca);
	}

	public LocalDate getDt_tarefa() {
		return dt_tarefa;
	}

	public void setDt_tarefa(LocalDate dt_tarefa) {
		this.dt_tarefa = dt_tarefa;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AtividadeMudanca other = (AtividadeMudanca) obj;
		return Objects.equals(id_atividade_mudanca, other.id_atividade_mudanca);
	}

	@Override
	public String toString() {
		return "AtividadeMudanca [id_atividade_mudanca=" + id_atividade_mudanca + ", atividade_mudanca="
				+ atividade_mudanca + ", duracao=" + duracao + ", responsavelAtividade=" + responsavelAtividade
				+ ", mudanca=" + mudanca + "]";
	}

}
