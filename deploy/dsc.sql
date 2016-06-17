-- Deploy detector_segment_conditions:dsc to pg
-- requires: tempseg_schema:tempseg_schema

BEGIN;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = tempseg, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: detector_segment_conditions; Type: TABLE; Schema: tempseg; Owner: slash; Tablespace:
--

CREATE TABLE detector_segment_conditions (
    components text[] NOT NULL,
    ts timestamp without time zone NOT NULL,
    endts timestamp without time zone,
    condition text NOT NULL,
    direction text NOT NULL
);

--
-- Name: detector_segment_conditions_pkey; Type: CONSTRAINT; Schema: tempseg; Owner: slash; Tablespace:
--

ALTER TABLE ONLY detector_segment_conditions
    ADD CONSTRAINT detector_segment_conditions_pkey PRIMARY KEY (ts, condition, components, direction);


--
-- Name: tempseg_detector_segment_conditions_idx; Type: INDEX; Schema: tempseg; Owner: slash; Tablespace:
--

CREATE INDEX tempseg_detector_segment_conditions_idx ON detector_segment_conditions USING btree (components,direction);


--
-- Name: tempseg_detector_segment_conditions_idx_ts; Type: INDEX; Schema: tempseg; Owner: slash; Tablespace:
--

CREATE INDEX tempseg_detector_segment_conditions_idx_ts ON detector_segment_conditions USING btree (ts);


--
-- Name: tempseg_detector_segment_conditions_idx_ts_endts; Type: INDEX; Schema: tempseg; Owner: slash; Tablespace:
--

CREATE INDEX tempseg_detector_segment_conditions_idx_ts_endts ON detector_segment_conditions USING btree (ts, endts);


--
-- Name: detector_segment_conditions_components_fkey; Type: FK CONSTRAINT; Schema: tempseg; Owner: slash
--

ALTER TABLE ONLY detector_segment_conditions
    ADD CONSTRAINT detector_segment_conditions_components_fkey FOREIGN KEY (components,direction) REFERENCES versioned_detector_segment_geometry(components,direction);



COMMIT;
