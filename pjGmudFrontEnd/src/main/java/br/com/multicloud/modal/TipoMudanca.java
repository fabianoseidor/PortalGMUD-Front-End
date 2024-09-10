package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class TipoMudanca implements Serializable{


	private static final long serialVersionUID = -5699366290086467554L;
	
	private Long id_tipo_mudanca;
	private String tipo_mudanca;
	private LocalDateTime dt_criacao;
	private String obs;

	public Long getId_tipo_mudanca() {
		return id_tipo_mudanca;
	}

	public void setId_tipo_mudanca(Long id_tipo_mudanca) {
		this.id_tipo_mudanca = id_tipo_mudanca;
	}


	public String getTipo_mudanca() {
		return tipo_mudanca;
	}


	public void setTipo_mudanca(String tipo_mudanca) {
		this.tipo_mudanca = tipo_mudanca;
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
		return Objects.hash(id_tipo_mudanca);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TipoMudanca other = (TipoMudanca) obj;
		return Objects.equals(id_tipo_mudanca, other.id_tipo_mudanca);
	}

	@Override
	public String toString() {
		return "TipoMudanca [id_tipo_mudanca=" + id_tipo_mudanca + ", tipo_mudanca=" + tipo_mudanca + ", dt_criacao="
				+ dt_criacao + ", obs=" + obs + "]";
	}
}
