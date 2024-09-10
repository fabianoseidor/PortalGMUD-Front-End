package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class ImpactoMudanca implements Serializable{

	private static final long serialVersionUID = -3306711753055965599L;

	private Long id_impacto_mudanca;
	private String impacto_mudanca;
	private LocalDateTime dt_criacao;
	private String obs;

	public Long getId_impacto_mudanca() {
		return id_impacto_mudanca;
	}

	public void setId_impacto_mudanca(Long id_impacto_mudanca) {
		this.id_impacto_mudanca = id_impacto_mudanca;
	}

	public String getImpacto_mudanca() {
		return impacto_mudanca;
	}

	public void setImpacto_mudanca(String impacto_mudanca) {
		this.impacto_mudanca = impacto_mudanca;
	}

	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}

	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_impacto_mudanca);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ImpactoMudanca other = (ImpactoMudanca) obj;
		return Objects.equals(id_impacto_mudanca, other.id_impacto_mudanca);
	}

	@Override
	public String toString() {
		return "ImpactoMudanca [id_impacto_mudanca=" + id_impacto_mudanca + ", impacto_mudanca=" + impacto_mudanca
				+ ", dt_criacao=" + dt_criacao + ", obs=" + obs + "]";
	}
}
