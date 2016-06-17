-- Verify detector_segment_conditions:dsc on pg

BEGIN;

select components,ts,endts,condition,direction
from tempseg.detector_segment_conditions
where false;

ROLLBACK;
