package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class ListaAprovadores implements Serializable{

	private static final long serialVersionUID = 1435008651713278470L;

	
	private Long id_lista_aprovadores;
	private Mudanca mudanca;
	private Aprovadores aprovadores;
	private Boolean statusAprovacao;
	private LocalDateTime dt_aprovacao;
	private LocalDateTime dt_criacao;

	public LocalDateTime getDt_aprovacao() {
		return dt_aprovacao;
	}

	public void setDt_aprovacao(LocalDateTime dt_aprovacao) {
		this.dt_aprovacao = dt_aprovacao;
	}

	public Long getId_lista_aprovadores() {
		return id_lista_aprovadores;
	}

	public void setId_lista_aprovadores(Long id_lista_aprovadores) {
		this.id_lista_aprovadores = id_lista_aprovadores;
	}

	public Mudanca getMudanca() {
		return mudanca;
	}

	public void setMudanca(Mudanca mudanca) {
		this.mudanca = mudanca;
	}

	public Aprovadores getAprovadores() {
		return aprovadores;
	}

	public void setAprovadores(Aprovadores aprovadores) {
		this.aprovadores = aprovadores;
	}

	public Boolean getStatusAprovacao() {
		return statusAprovacao;
	}

	public void setStatusAprovacao(Boolean statusAprovacao) {
		this.statusAprovacao = statusAprovacao;
	}

	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}

	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_lista_aprovadores);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ListaAprovadores other = (ListaAprovadores) obj;
		return Objects.equals(id_lista_aprovadores, other.id_lista_aprovadores);
	}

	@Override
	public String toString() {
		return "ListaAprovadores [id_lista_aprovadores=" + id_lista_aprovadores + ", mudanca=" + mudanca
				+ ", aprovadores=" + aprovadores + ", statusAprovacao=" + statusAprovacao + ", dt_criacao=" + dt_criacao
				+ "]";
	}
}
