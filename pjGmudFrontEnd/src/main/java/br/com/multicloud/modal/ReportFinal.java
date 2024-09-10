package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class ReportFinal implements Serializable{

	private static final long serialVersionUID = -3021784576154221465L;

	private Long id_report_final;
	private String report_final;
	private LocalDateTime dt_criacao;
	private Mudanca mudanca;

	public Mudanca getMudanca() {
		return mudanca;
	}

	public void setMudanca(Mudanca mudanca) {
		this.mudanca = mudanca;
	}

	public Long getId_report_final() {
		return id_report_final;
	}


	public void setId_report_final(Long id_report_final) {
		this.id_report_final = id_report_final;
	}


	public String getReport_final() {
		return report_final;
	}


	public void setReport_final(String report_final) {
		this.report_final = report_final;
	}


	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}


	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}


	@Override
	public int hashCode() {
		return Objects.hash(id_report_final);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReportFinal other = (ReportFinal) obj;
		return Objects.equals(id_report_final, other.id_report_final);
	}


	@Override
	public String toString() {
		return "ReportFinal [id_report_final=" + id_report_final + ", report_final=" + report_final + ", dt_criacao="
				+ dt_criacao + ", mudanca=" + mudanca + "]";
	}
}
