package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class StatusAtividade implements Serializable{

	private static final long serialVersionUID = 2648909176194038972L;
	
	private Long id_status_atividade;
	private String status_atividade;
	private LocalDateTime dt_criacao;
	private String obs;

	public Long getId_status_atividade() {
		return id_status_atividade;
	}

	public void setId_status_atividade(Long id_status_atividade) {
		this.id_status_atividade = id_status_atividade;
	}

	public String getStatus_atividade() {
		return status_atividade;
	}

	public void setStatus_atividade(String status_atividade) {
		this.status_atividade = status_atividade;
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
		return Objects.hash(id_status_atividade);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StatusAtividade other = (StatusAtividade) obj;
		return Objects.equals(id_status_atividade, other.id_status_atividade);
	}

	@Override
	public String toString() {
		return "StatusAtividade [id_status_atividade=" + id_status_atividade + ", status_atividade=" + status_atividade
				+ ", dt_criacao=" + dt_criacao + ", obs=" + obs + "]";
	}
}
