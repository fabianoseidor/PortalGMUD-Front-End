package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class PlanoComunicacao implements Serializable{

	private static final long serialVersionUID = -280457124494665261L;

	private Long id_plano_comunicacao;
	private String nome_contato;
	private String email;
	private String empresa;
	private LocalDateTime dt_criacao;
	private Mudanca mudanca;

	public Long getId_plano_comunicacao() {
		return id_plano_comunicacao;
	}

	public Mudanca getMudanca() {
		return mudanca;
	}

	public void setMudanca(Mudanca mudanca) {
		this.mudanca = mudanca;
	}

	public void setId_plano_comunicacao(Long id_plano_comunicacao) {
		this.id_plano_comunicacao = id_plano_comunicacao;
	}

	public String getNome_contato() {
		return nome_contato;
	}

	public void setNome_contato(String nome_contato) {
		this.nome_contato = nome_contato;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmpresa() {
		return empresa;
	}

	public void setEmpresa(String empresa) {
		this.empresa = empresa;
	}

	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}

	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}


	@Override
	public int hashCode() {
		return Objects.hash(id_plano_comunicacao);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PlanoComunicacao other = (PlanoComunicacao) obj;
		return Objects.equals(id_plano_comunicacao, other.id_plano_comunicacao);
	}

	@Override
	public String toString() {
		return "PlanoComunicacao [id_plano_comunicacao=" + id_plano_comunicacao + ", nome_contato=" + nome_contato
				+ ", email=" + email + ", empresa=" + empresa + ", dt_criacao=" + dt_criacao + ", mudanca=" + mudanca
				+ "]";
	}


}
