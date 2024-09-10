package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;

public class DadosMudanca implements Serializable{


	private static final long serialVersionUID = 1194808759928751453L;
	private Long id_dados_mudanca;
	private LocalDate dt_inicio;
	private LocalTime hr_inicio;
	private LocalDate dt_final;
	private LocalTime hr_final;
	private String dsc_mudanca;
	private String justificativa_mudanca;
	private Mudanca mudanca;
	
	public Mudanca getMudanca() {
		return mudanca;
	}

	public void setMudanca(Mudanca mudanca) {
		this.mudanca = mudanca;
	}

	public Long getId_dados_mudanca() {
		return id_dados_mudanca;
	}

	public void setId_dados_mudanca(Long id_dados_mudanca) {
		this.id_dados_mudanca = id_dados_mudanca;
	}

	public LocalDate getDt_inicio() {
		return dt_inicio;
	}

	public void setDt_inicio(LocalDate dt_inicio) {
		this.dt_inicio = dt_inicio;
	}

	public LocalTime getHr_inicio() {
		return hr_inicio;
	}

	public void setHr_inicio(LocalTime hr_inicio) {
		this.hr_inicio = hr_inicio;
	}

	public LocalDate getDt_final() {
		return dt_final;
	}

	public void setDt_final(LocalDate dt_final) {
		this.dt_final = dt_final;
	}

	public LocalTime getHr_final() {
		return hr_final;
	}

	public void setHr_final(LocalTime hr_final) {
		this.hr_final = hr_final;
	}

	public String getDsc_mudanca() {
		return dsc_mudanca;
	}

	public void setDsc_mudanca(String dsc_mudanca) {
		this.dsc_mudanca = dsc_mudanca;
	}

	public String getJustificativa_mudanca() {
		return justificativa_mudanca;
	}

	public void setJustificativa_mudanca(String justificativa_mudanca) {
		this.justificativa_mudanca = justificativa_mudanca;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_dados_mudanca);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DadosMudanca other = (DadosMudanca) obj;
		return Objects.equals(id_dados_mudanca, other.id_dados_mudanca);
	}

	@Override
	public String toString() {
		return "DadosMudanca [id_dados_mudanca=" + id_dados_mudanca + ", dt_inicio=" + dt_inicio + ", hr_inicio="
				+ hr_inicio + ", dt_final=" + dt_final + ", hr_final=" + hr_final + ", dsc_mudanca=" + dsc_mudanca
				+ ", justificativa_mudanca=" + justificativa_mudanca + ", mudanca=" + mudanca + "]";
	}



}
