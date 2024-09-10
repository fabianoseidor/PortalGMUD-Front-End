package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class Criticidade implements Serializable{

	private static final long serialVersionUID = 4618126659048867283L;

    private Long id_criticidade;
    private String criticidade;
    private LocalDateTime dt_criacao;
    private String obs;
	
	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}


	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}


	public Long getId_criticidade() {
		return id_criticidade;
	}

	public void setId_criticidade(Long id_criticidade) {
		this.id_criticidade = id_criticidade;
	}

	public String getCriticidade() {
		return criticidade;
	}

	public void setCriticidade(String criticidade) {
		this.criticidade = criticidade;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_criticidade);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Criticidade other = (Criticidade) obj;
		return Objects.equals(id_criticidade, other.id_criticidade);
	}

	@Override
	public String toString() {
		return "Criticidade [id_criticidade=" + id_criticidade + ", criticidade=" + criticidade + ", dt_criacao="
				+ dt_criacao + ", obs=" + obs + "]";
	}	
}
